<p align="center">
  <h1 align="center">🩸 DiabetesKit</h1>
  <p align="center">
    Printable health management tools for diabetes patients
    <br />
    为糖尿病患者提供便捷、可打印的健康管理工具
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

**DiabetesKit** is an open-source collection of **printable health management tools** for diabetes patients. Our goal is to make daily health tracking as barrier-free as possible — especially tailored for elderly users.

## 📥 Quick Download

> **No setup needed!** Download, print (A4 Portrait), and start tracking immediately.

| Template | 中文 (Chinese) | English |
|----------|:-:|:-:|
| 🩸 Blood Glucose Log | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-zh.pdf) | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-en.pdf) |

---

## 📖 How to Use (+ AI Workflow)

### 1. 🩸 Blood Glucose Monitoring Log
A single-page monthly record sheet specifically designed for seniors:
- **Elderly-Friendly Design**: Large cells (A4 Portrait), large fonts, and no cluttered lines to make handwriting easy.
- **Color-Coded**: Morning (Blue), Noon (Green), Evening (Purple) categorization helps users quickly find the right column.
- **Personalized Reference Ranges**: Includes relaxed targets suitable for elderly patients with comorbidities, and highlights critical life-threatening readings in screaming red.

### 2. 🤖 AI Monthly Analysis Guide
The "Monthly Summary" section at the bottom is **NOT meant for the patient to calculate manually** — it's left blank intentionally for AI! 

At the end of the month, **simply snap a photo of the completed page** with your smartphone and send it to any major vision-enabled AI (like ChatGPT, Claude, Gemini, etc.), alongside this specially crafted **Prompt**:

> #### 💡 Copy this prompt to your AI:
> 
> ```text
> Hello! Attached is a photo of a filled-out Blood Glucose monitoring log for this month. Please provide a comprehensive monthly analysis and calculate the numbers needed for the "Monthly Summary" section at the bottom of the table.
> 
> Please note: Some cells might be blank (the patient might have forgotten to measure). This is completely normal. Please ignore any blank cells in your calculations, ensure robustness, and do not throw any errors.
> 
> Please format your response exactly like this:
> 
> ### 1. Monthly Summary Values (Provide the exact numbers so I can copy them into the paper log):
> - **Avg**: [Calculate the average of all recorded glucose values this month, to 1 decimal place]
> - **High**: [Find the highest recorded value, and state exactly which day/time it occurred]
> - **Low**: [Find the lowest recorded value, and state exactly which day/time it occurred]
> - **Hypo Episodes**: [Count the precise number of times glucose was < 3.9. If none, write 0]
> 
> ### 2. Detailed Medical Analysis & Recommendations (Evaluate based on the reference ranges printed on the form):
> - **Overall Assessment**: How well is the blood glucose controlled this month? What is the rough target achievement rate?
> - **Patterns or Issues Found**: E.g., "Post-lunch glucose is consistently high" or "An upward trend in fasting glucose towards the end of the month." Correlate this with any text found in the 'Notes' column (e.g., diet details, medication changes) to find root causes.
> - **Actionable Advice**:
>   - Diet & Lifestyle: What specific lifestyle adjustments should be considered?
>   - Medical Review: Does the current plan need adjusting? Ensure you prompt the patient to discuss specific medication adjustments with their doctor at the next visit if patterns warrant it.
> - **Health Alerts**: Heavily warn about any risks of asymptomatic hypoglycemia or sustained dangerous hyperglycemia.
> ```

Once the AI returns the data, just copy the numbers into the physical paper for archiving. You also get a professional medical summary ready to show your doctor at the next appointment!

---

## ✨ Design Philosophy

- **Maximum Simplicity** — Remove all visual noise, dedicating the maximum area for handwriting text and numbers.
- **Analog Collection, AI Intelligence** — Use the most accessible medium (pen and paper) for daily tracking, and leverage cutting-edge Vision-AI for monthly math and pattern-recognition.
- **Global Architecture** — A pure JSON-based i18n system allows the open-source community to add languages for patients anywhere in the world effortlessly.

---

## 👨‍💻 Developer Guide

If you are a developer, designer, or want to contribute a translation, see below. The repository essentially uses `LuaLaTeX` to render JSON locales into PDFs.

### 🏗️ Project Structure

```
DiabetesKit/
├── src/glucose-record.tex      # 📄 Core LaTeX template (language-agnostic)
├── locales/*.json              # 🌍 i18n config limits (zh_CN, en_US)
├── scripts/gen-locale-tex.py   # 🔧 JSON → LaTeX macro generator
├── .version                    # 🏷️ Single source of truth for versions
├── Makefile                    # 🎯 Build entry point
└── .github/workflows/          # 🚀 Auto-build & release CI/CD
```

### 🔨 Build Locally

- **Engine**: LuaLaTeX (included in TeX Live / MacTeX, `brew install --cask mactex`)
- **Script**: Python 3

```bash
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit
make all        # Build all PDFs into pdf/ 
make clean      # Clean up temp artifacts
```

### 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.
- 🌍 **Add your language**: Copy an existing `locales/*.json` file, translate it, add it to the Makefile, and you're done!
- 📋 **New templates**: E.g. blood pressure log, medication tracker.

---

## 📄 License

[MIT License](LICENSE)
