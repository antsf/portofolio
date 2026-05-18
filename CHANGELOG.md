# Changelog

## 2026-05-19

### Changed
- Urutan section: Projects naik ke atas (setelah Marquee), About turun ke bawah
- Projects section jadi **sticky horizontal scroll** (referensi Jessica Wells)
- Nav link urutan disesuaikan

### Added
- Project cards jadi clickable link ke Play Store
- Highlight card (border accent) untuk Ferry, POS, Logistics, Anaking
- Animasi `reveal-right` (geser dari kanan)
- Anaking project dengan deskripsi lengkap

### Fixed
- Hero padding-top 100px biar badge gak ketimpa nav sticky

### Removed
- Next.js dependencies dan config
- Old components (About, Contact, Hero, Navbar, Work TSX)
- Tailwind, PostCSS, ESLint, TypeScript config

## 2026-05-18

### Added
- Portfolio HTML awal (Next.js → plain HTML)
- Custom cursor, progress bar, scroll reveal, marquee
- Deploy ke GitHub Pages
