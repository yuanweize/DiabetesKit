# Contributing to DiabetesKit / 贡献指南

[English](#english) | [中文](#中文)

---

## English

Thank you for contributing to DiabetesKit! This project provides printable health management tools for diabetes patients worldwide.

### How to Contribute

#### 🌍 Add a New Language
1. Copy `locales/en_US.json` → `locales/<lang_code>.json`
2. Translate all string values
3. Add a build rule in `Makefile` (copy an existing rule, change locale name)
4. Test: `make all`
5. Submit a Pull Request

#### 📋 Add a New Template
1. Create `src/<template-name>.tex` using locale macros (`\langXxx`)
2. Add corresponding keys to all `locales/*.json` files
3. Add build rules in `Makefile`
4. Test and submit PR

#### 📐 Design Guidelines
- **Single page** — Every template must fit on one A4 page
- **Large, clear text** — Target users may be elderly
- **AI-friendly** — Structured layout for easy photo analysis
- **Portrait A4** — For tables with many rows (or Landscape if needed)

### Development Setup

```bash
# Prerequisites: LuaLaTeX + Python 3
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit
make all
```

---

## 中文

感谢您对 DiabetesKit 的贡献！本项目为全球糖尿病患者提供可打印的健康管理工具。

### 如何贡献

#### 🌍 添加新语言
1. 复制 `locales/en_US.json` → `locales/<语言代码>.json`
2. 翻译所有字符串值
3. 在 `Makefile` 中添加构建规则（复制已有规则，修改语言名称）
4. 测试：`make all`
5. 提交 Pull Request

#### 📋 添加新模板
1. 在 `src/` 下创建 `<模板名>.tex`，使用语言宏（`\langXxx`）
2. 在所有 `locales/*.json` 中添加对应键值
3. 在 `Makefile` 中添加构建规则
4. 测试并提交 PR

#### 📐 设计准则
- **单页** — 每个模板必须在一张 A4 纸上完成
- **字大清晰** — 目标用户可能是老年人
- **AI 友好** — 结构化布局，便于拍照分析
- **竖向 A4** — 适合多行表格（如需多列也可横向）

### 开发环境

```bash
# 前置条件：LuaLaTeX + Python 3
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit
make all
```
