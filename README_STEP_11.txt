# TemanTumbuh — PWA revisi

Media bimbingan belajar digital untuk mendukung keterampilan manajemen waktu dan membantu siswa mengurangi kebiasaan menunda tugas akademik.

## Isi paket
- `index.html` — aplikasi utama
- `manifest.json` — identitas PWA TemanTumbuh
- `sw.js` — service worker dan cache offline
- `icon-192.png`, `icon-512.png` — ikon aplikasi (ikon lama dipertahankan; dapat diganti dengan logo TemanTumbuh khusus)

## Deploy ke GitHub Pages
1. Buat salinan/branch cadangan repository lama.
2. Unggah kelima file ini ke folder yang sama dengan `index.html`.
3. Commit dan pastikan GitHub Pages menggunakan folder/branch yang benar.
4. Buka situs melalui HTTPS. Untuk memperbarui PWA yang pernah dipasang, tutup aplikasi dan buka kembali setelah service worker memperbarui cache.

## Fitur yang dipertahankan
Daftar tugas, pemecahan tugas, prioritas, target/misi, progres, materi belajar, tips, refleksi, evaluasi, personalisasi nama, dan instalasi PWA. Kunci penyimpanan fitur lama sengaja tidak diganti agar data lama pada perangkat yang sama tetap dapat dibaca.

## Penambahan
- Halaman Rencana Belajar untuk menyimpan aktivitas, tanggal target, durasi, dan status selesai.
- Timer fokus 25 menit dengan jeda dan reset.
- Bahasa antarmuka diarahkan ke konteks belajar siswa dan manajemen waktu.
- Identitas aplikasi dan cache PWA diganti menjadi TemanTumbuh.

Catatan: data aplikasi disimpan secara lokal di browser/perangkat; tidak otomatis tersinkron antarperangkat. Evaluasi penelitian tetap perlu disesuaikan dengan instrumen angket yang digunakan dalam proposal.
