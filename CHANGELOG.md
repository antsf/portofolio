# Changelog

<!-- Timeline:
     Sep 2023 – May 2025 : Next.js (original)
     May 2025 – May 2026 : Flutter Web (interim)
     May 2026 – now      : Plain HTML (GitHub Pages)
-->

## 2026-05-19

### Changed
- Projects section: sticky horizontal scroll → 3-column grid with alternating reveal-left/reveal-right
- Nav link urutan disesuaikan

### Added
- Experience entry: Freelance 2019–2021 (Web Developer & UI/UX)
- Project cards jadi clickable link ke Play Store
- Highlight card (border accent) untuk Ferry, POS, Logistics, Anaking
- Animasi `reveal-right` (geser dari kanan)
- Anaking project dengan deskripsi lengkap

### Fixed
- Hero padding-top 100px biar badge gak ketimpa nav sticky

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
