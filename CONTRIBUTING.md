# Contributing to DiabetesKit / 贡献指南

[English](#english) | [中文](#中文)

---

## English

Thank you for your interest in contributing to DiabetesKit! This project aims to provide free, printable health management tools for diabetes patients worldwide.

### How to Contribute

#### 🐛 Report Issues
- Use [GitHub Issues](../../issues) to report bugs or suggest improvements
- Include your OS, Pandoc version, and LaTeX distribution if reporting build issues

#### 📝 Add or Improve Templates
1. Fork the repository
2. Create a new branch: `git checkout -b feature/my-template`
3. Add your template under `templates/<template-name>/<lang>/`
4. Register it in the root `Makefile` (add one line to `TEMPLATES`)
5. Test locally: `make all`
6. Submit a Pull Request

#### 🌍 Add a New Language
1. Create a new language directory: `templates/<template-name>/<lang-code>/`
2. Translate the template content
3. Add the entry to `Makefile` → `TEMPLATES`
4. Update `README.md` and `README_CN.md` with download links

#### 📐 Template Design Guidelines
- **Simplicity first** — Target users may be elderly; minimize complexity
- **A4 printable** — All templates should fit on standard A4 paper
- **Landscape preferred** — For tables with multiple columns
- **Include reference ranges** — Help users understand their readings
- **Use LaTeX via Pandoc** — For consistent, professional output

### Development Setup

```bash
# Prerequisites
# - Pandoc (https://pandoc.org/installing.html)
# - XeLaTeX (via TeX Live or MacTeX)
# - CJK fonts (for Chinese support)

# Clone and build
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit
make all
```

### Code of Conduct

Be kind, be respectful, be helpful. We're building tools that help real people manage their health.

---

## 中文

感谢您对 DiabetesKit 的关注！本项目旨在为全球糖尿病患者提供免费、可打印的健康管理工具。

### 如何贡献

#### 🐛 报告问题
- 使用 [GitHub Issues](../../issues) 报告错误或提出改进建议
- 如反馈构建问题，请附上您的操作系统、Pandoc 版本及 LaTeX 发行版信息

#### 📝 添加或改进模板
1. Fork 本仓库
2. 创建新分支：`git checkout -b feature/my-template`
3. 在 `templates/<模板名>/<语言代码>/` 下添加模板
4. 在根目录 `Makefile` 的 `TEMPLATES` 中注册（仅需添加一行）
5. 本地测试：`make all`
6. 提交 Pull Request

#### 🌍 添加新语言
1. 创建语言目录：`templates/<模板名>/<语言代码>/`
2. 翻译模板内容
3. 在 `Makefile` → `TEMPLATES` 中添加条目
4. 更新 `README.md` 和 `README_CN.md` 中的下载链接

#### 📐 模板设计准则
- **简洁至上** — 目标用户可能是老年人，尽量减少复杂性
- **A4 可打印** — 所有模板应适配标准 A4 纸张
- **横向优先** — 多列表格使用横向布局
- **包含参考范围** — 帮助用户理解自己的数值
- **使用 Pandoc + LaTeX** — 确保一致、专业的输出效果

### 开发环境搭建

```bash
# 前置条件
# - Pandoc (https://pandoc.org/installing.html)
# - XeLaTeX (通过 TeX Live 或 MacTeX 安装)
# - CJK 字体（中文支持）

# 克隆并构建
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit
make all
```

### 行为准则

善意、尊重、乐于助人。我们正在构建帮助真实用户管理健康的工具。
