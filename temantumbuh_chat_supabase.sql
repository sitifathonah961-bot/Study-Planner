-- TemanTumbuh: komunikasi pribadi Guru BK dan siswa
-- Jalankan sekali di Supabase SQL Editor. Tidak mengubah tabel/progres yang sudah ada.

create table if not exists public.tt_chat_messages (
  id uuid primary key default gen_random_uuid(),
  teacher_id uuid not null references public.profiles(id) on delete cascade,
  student_id uuid not null references public.profiles(id) on delete cascade,
  sender_id uuid not null references auth.users(id) on delete cascade,
  message text not null check (char_length(trim(message)) between 1 and 3000),
  created_at timestamptz not null default now()
);

create index if not exists tt_chat_pair_created_idx
  on public.tt_chat_messages (teacher_id, student_id, created_at);

alter table public.tt_chat_messages enable row level security;

drop policy if exists "tt chat participants can read" on public.tt_chat_messages;
create policy "tt chat participants can read"
on public.tt_chat_messages for select to authenticated
using (
  auth.uid() = teacher_id
  or auth.uid() = student_id
);

drop policy if exists "tt chat participants can send" on public.tt_chat_messages;
create policy "tt chat participants can send"
on public.tt_chat_messages for insert to authenticated
with check (
  sender_id = auth.uid()
  and (auth.uid() = teacher_id or auth.uid() = student_id)
  and exists (
    select 1 from public.profiles s
    where s.id = student_id and s.role = 'siswa' and s.teacher_id = teacher_id
  )
);

-- Pesan tidak dapat diedit atau dihapus melalui kebijakan klien.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'tt_chat_messages'
  ) then
    alter publication supabase_realtime add table public.tt_chat_messages;
  end if;
exception when undefined_object then
  raise notice 'Publication supabase_realtime belum tersedia; pesan tetap dapat dimuat saat chat dibuka.';
end $$;
