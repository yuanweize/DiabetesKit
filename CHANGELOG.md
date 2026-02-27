# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

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
