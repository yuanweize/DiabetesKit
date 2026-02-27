# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.5.0] - 2026-02-27

### Changed

- 🩺 **Personalized Reference Ranges** — Relaxed fasting (5.0-8.0) and post-meal (< 11.0) targets based on ADA elderly guidelines.
- 🐛 **Fix CI** — Fixed `luatexja.sty` missing error by adding `texlive-lang-japanese` to Ubuntu deps.

## [1.4.0] - 2026-02-27

### Changed

- 🎨 **Color-coded time groups** — Grouped morning (blue), noon (green), and evening (purple) for easier visual tracking.
- 📐 **Reference limits redesign** — Moved reference bounds to distinct, colored callout boxes at the bottom.
- 🔍 **Larger header text** — Ensured all table headers are easily readable by elderly users.

## [1.3.0] - 2026-02-27

### Changed

- 🧹 **Single-row header** — Eliminated confusing multi-row cell merges. Every column now has a standalone, clear label (e.g. "早餐后两小时").
- 🖨️ **Print-friendly grayscale** — Swapped navy-blue headers for dark gray to save ink and print cleanly on B&W printers.

## [1.2.0] - 2026-02-27

### Changed

- 📄 **Portrait Orientation** — Flipped from landscape to A4 portrait (竖向) to provide significantly wider cells for handwriting.
- 🚀 **Switched to LuaLaTeX** — Replaced XeLaTeX with LuaLaTeX for improved font handling and modern compilation.
- 🗣️ **Clearer Chinese Labels** — Spelled out terms like "餐后两小时" instead of using English abbreviations like "2h".
- 🚨 **Emergency Footer** — Added a prominent red warning banner at the bottom for severe hypo/hyperglycemia thresholds.

## [1.1.0] - 2026-02-27

### Changed

- ♻️ **Complete project restructure** — Pure LaTeX source + JSON i18n pipeline
- 📄 **Single-page PDF** — Redesigned table to fit one A4 landscape page
- 🩸 **Improved table layout** — 6 glucose columns (Morning/Noon/Evening × Pre/Post)
- 🤖 **AI-friendly monthly summary** — Clean grid for photo → AI analysis
- 📖 **Updated all documentation** — New project structure, no personal stories

### Removed

- Pandoc dependency (now uses XeLaTeX directly)
- Markdown template files (replaced with LaTeX)

## [1.0.0] - 2026-02-27

### Added

- 🩸 **Blood Glucose Monitoring Log** — Monthly printable record sheet
  - Chinese (简体中文) version
  - English version
- 🔧 **Build System** — Makefile + `md2pdf.sh` script (Pandoc + XeLaTeX)
- 🚀 **CI/CD** — GitHub Actions workflow for automated PDF build & release
- 📖 **Documentation** — Bilingual README (EN/CN), Contributing Guide
