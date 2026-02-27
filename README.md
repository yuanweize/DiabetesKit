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

> **No setup needed!** Just download, print, and start tracking.

| Template | 中文 (Chinese) | English |
|----------|:-:|:-:|
| 🩸 Blood Glucose Log | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/blood-glucose-log_zh.pdf) | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/blood-glucose-log_en.pdf) |

> **Print Settings:** A4 paper, **Landscape** orientation, 100% scale.

---

## 💡 About

DiabetesKit is an open-source collection of **printable health management tools** designed specifically for **Type 2 diabetes patients**. Our goal is to make daily health tracking as simple as possible — especially for elderly users.

### Design Philosophy

- **✨ Simplicity** — Minimal fields, maximum clarity. Easy for elderly users to fill in
- **🖨️ Print-Ready** — Professional PDF output, optimized for A4 paper
- **🌍 Multilingual** — Templates available in multiple languages
- **🔧 Extensible** — Easy to add new templates and languages

### Available Templates

#### 🩸 Blood Glucose Monitoring Log

A monthly record sheet for tracking daily blood glucose readings.

| Field | Description |
|-------|-------------|
| Day (1-31) | Pre-filled for the entire month |
| Time Point | Fasting / After Breakfast / After Lunch / After Dinner / Bedtime |
| Glucose (mmol/L) | Blood glucose reading |
| Medication | Simple ✓ or ✗ |
| Notes | Diet, exercise, or how you feel |

Includes a **monthly summary** section and **reference ranges** at the bottom.

---

## 🏗️ Project Structure

```
DiabetesKit/
├── templates/                  # 📋 Printable templates
│   └── blood-glucose-log/      #    Blood glucose monitoring log
│       ├── zh/                  #      Chinese version
│       └── en/                  #      English version
├── scripts/                    # 🔧 Build utilities
│   └── md2pdf.sh               #    Markdown → PDF converter
├── .github/workflows/          # 🚀 CI/CD pipeline
│   └── build-and-release.yml   #    Auto-build & release PDFs
├── output/                     # 📦 Built PDFs (gitignored)
├── Makefile                    # 🎯 Build entry point
├── CONTRIBUTING.md             # 🤝 Contribution guide
├── CHANGELOG.md                # 📝 Version history
└── LICENSE                     # ⚖️ MIT License
```

> **Adding new tools?** Simply create a new directory under `templates/`, add your `.md` file, and register it in the `Makefile`. See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

---

## 🔨 Build Locally

### Prerequisites

| Tool | Purpose | Install |
|------|---------|---------|
| [Pandoc](https://pandoc.org/installing.html) | Document converter | `brew install pandoc` |
| [XeLaTeX](https://www.tug.org/texlive/) | PDF engine with CJK support | `brew install --cask mactex` |

### Build

```bash
# Clone the repository
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit

# Build all PDFs
make all

# Build specific language
make zh    # Chinese only
make en    # English only

# Clean build output
make clean

# Show available targets
make help
```

Built PDFs will be in the `output/` directory.

---

## 🚀 CI/CD

This project uses **GitHub Actions** to automatically build and release PDFs:

1. **Trigger**: Push a version tag (e.g., `git tag v1.0.0 && git push --tags`)
2. **Build**: Compiles all templates into PDFs using Pandoc + XeLaTeX
3. **Release**: Creates a GitHub Release with all PDFs as downloadable assets

---

## 🤝 Contributing

We welcome contributions! Whether it's:
- 🌍 **Translations** — Add your language
- 📋 **New templates** — Blood pressure, medication tracking, etc.
- 🐛 **Bug fixes** — Report or fix issues
- 📖 **Documentation** — Improve the guides

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed instructions.

---

## ❤️ Why This Project?

This project was born from a personal need — helping a 79-year-old grandmother manage her Type 2 diabetes with a simple, printable blood glucose log. We believe healthcare tools should be **free**, **accessible**, and **easy to use** for everyone, regardless of age or technical ability.

If this helps you or someone you love, consider ⭐ starring the repo and sharing it with others who might benefit.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE) — free for personal and commercial use.
