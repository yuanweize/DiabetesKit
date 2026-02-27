<p align="center">
  <h1 align="center">🩸 DiabetesKit</h1>
  <p align="center">
    Free, printable health management tools for diabetes patients
    <br />
    为糖尿病患者提供免费、可打印的健康管理工具
  </p>
  <p align="center">
    <a href="https://github.com/yuanweize/DiabetesKit/actions/workflows/build-and-release.yml"><img src="https://github.com/yuanweize/DiabetesKit/actions/workflows/build-and-release.yml/badge.svg" alt="Build Status"></a>
    <a href="https://github.com/yuanweize/DiabetesKit/releases/latest"><img src="https://img.shields.io/github/v/release/yuanweize/DiabetesKit?label=latest%20release" alt="Latest Release"></a>
    <a href="LICENSE"><img src="https://img.shields.io/github/license/yuanweize/DiabetesKit" alt="License"></a>
  </p>
  <p align="center">
    <a href="README_CN.md">🇨🇳 中文文档</a> ·
    <a href="https://github.com/yuanweize/DiabetesKit/releases/latest">📥 Download PDFs</a> ·
    <a href="https://github.com/yuanweize/DiabetesKit/issues">🐛 Report Issue</a>
  </p>
</p>

---

## 📥 Quick Download

> **No setup needed!** Download, print (A4 Landscape), and start tracking.

| Template | 中文 (Chinese) | English |
|----------|:-:|:-:|
| 🩸 Blood Glucose Log | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-zh.pdf) | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-en.pdf) |

---

## 💡 About

**DiabetesKit** is an open-source collection of **printable health management tools** for diabetes patients. Our goal is to make daily health tracking as simple as possible — especially for elderly users.

> Currently focused on Type 2 diabetes management, with plans to expand support for other types and additional health tracking tools.

### Design Philosophy

- **✨ Simplicity** — Large fonts, minimal fields, one page per month
- **🖨️ Print-Ready** — Single-page A4 landscape PDF, optimized for handwriting
- **🤖 AI-Friendly** — Structured layout designed for easy photo → AI analysis
- **🌍 Multilingual** — JSON-based i18n system, easy to add new languages
- **🔧 Extensible** — Add new templates with minimal effort

### Available Templates

#### 🩸 Blood Glucose Monitoring Log

A single-page monthly record sheet with:

| Column Group | Fields |
|:---:|---|
| **Morning (早)** | Fasting / 2h Post-breakfast |
| **Noon (中)** | Pre-lunch / 2h Post-lunch |
| **Evening (晚)** | Pre-dinner / 2h Post-dinner |
| **Notes** | Medication, diet, exercise, condition |

Plus: monthly summary section (AI-analyzable), reference ranges, and emergency doctor contact.

---

## 🏗️ Project Structure

```
DiabetesKit/
├── src/                        # 📄 LaTeX source files
│   └── glucose-record.tex      #    Core template (language-agnostic)
├── locales/                    # 🌍 i18n locale files (JSON)
│   ├── zh_CN.json              #    Chinese strings
│   └── en_US.json              #    English strings
├── scripts/                    # 🔧 Build utilities
│   └── gen-locale-tex.py       #    JSON → LaTeX macro generator
├── pdf/                        # 📦 Built PDFs (gitignored)
├── .github/workflows/          # 🚀 CI/CD
│   └── build-and-release.yml   #    Auto-build & release on tag
├── Makefile                    # 🎯 Build entry point
├── CONTRIBUTING.md             # 🤝 Contribution guide
├── CHANGELOG.md                # 📝 Version history
└── LICENSE                     # ⚖️ MIT License
```

### How i18n Works

```
locales/zh_CN.json  ──→  gen-locale-tex.py  ──→  locale.tex (macros)
                                                      ↓
                         src/glucose-record.tex  + locale.tex  ──→  XeLaTeX  ──→  PDF
```

One LaTeX source, multiple languages. Adding a language = one JSON file + one Makefile rule.

---

## 🔨 Build Locally

### Prerequisites

| Tool | Purpose | Install |
|------|---------|---------|
| [XeLaTeX](https://www.tug.org/texlive/) | PDF engine (CJK support) | `brew install --cask mactex` |
| Python 3 | Locale script | Pre-installed on macOS |

### Build

```bash
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit

make all        # Build all PDFs
make zh         # Chinese only
make en         # English only
make clean      # Remove build artifacts
make help       # Show targets
```

---

## 🚀 CI/CD

Push a version tag to auto-build and release:

```bash
git tag v1.1.0
git push --tags
# → GitHub Actions builds PDFs → Creates Release with PDF assets
```

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

**Quick ideas:**
- 🌍 Add your language (just create a `locales/*.json` file)
- 📋 New templates (blood pressure, medication tracker, etc.)
- 🐛 Bug fixes and improvements

---

## 📄 License

[MIT License](LICENSE) — free for personal and commercial use.
