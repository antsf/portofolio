# Changelog

<!-- Timeline:
     Sep 2023 – May 2025 : Next.js (original)
     May 2025 – May 2026 : Flutter Web (interim)
     May 2026 – now      : Plain HTML (GitHub Pages)
-->

## 2026-05-19

### Changed
- Projects section: sticky horizontal scroll → 3-column grid with alternating reveal-left/reveal-right
- Projects wrapped in proper section dengan bento grid (lalu di-revert balik ke 3-kolom)
- Nav link urutan disesuaikan
- Logistics & POS: Flutter → Kotlin / Jetpack Compose
- Tire Repair Locator: Flutter → Kotlin XML
- Ferry: deskripsi Indonesia → English ringkas; highlight diganti
- Anaking: rename jadi "Parenting Platform", label Flutter dihapus, deskripsi diringkas ke English
- Footer: tahun di-fix ke 2026, tagline jadi "Built with fun"
- Stats: live products 6 → 7
- Freelance bullets ke English

### Added
- Experience entry: Freelance 2019–2021 (Web Developer & UI/UX)
- Project cards jadi clickable link ke Play Store
- Highlight card (border accent) untuk Ferry, POS, Logistics, Anaking
- Highlight (bold) di semua deskripsi project; Elisoft end-to-end highlight
- Animasi `reveal-right` (geser dari kanan)
- Anaking project dengan deskripsi lengkap
- React, Next.js, Tailwind di section About, Services, dan Tech Stack

### Fixed
- Hero padding-top 100px biar badge gak ketimpa nav sticky
- Title overflow di mobile: kecilin clamp font hero & section
- Mobile: projects jadi 1-kolom, fix contact overflow
- HTML entity & indentasi dirapihin

### Removed
- Horizontal scroll JS (sticky-scroll, project-spacer, projectsTrack logic)
- Sticky scroll CSS classes
- Next.js dependencies dan config
- Old components (About, Contact, Hero, Navbar, Work TSX)
- Tailwind, PostCSS, ESLint, TypeScript config

## 2026-05-18

### Added
- Portfolio HTML awal (Next.js → plain HTML)
- Custom cursor, progress bar, scroll reveal, marquee
- Deploy ke GitHub Pages

### Previous Versions (no longer in repo)

| Period       | Platform   | Description         |
|--------------|------------|---------------------|
| Sep 2023 – May 2025 | Next.js    | Original portfolio |
| May 2025 – May 2026 | Flutter Web | Interim version   |
