<p align="center">
  <h1 align="center">🩸 DiabetesKit</h1>
  <p align="center">
    为糖尿病患者提供免费、可打印的健康管理工具
    <br />
    Free, printable health management tools for diabetes patients
  </p>
  <p align="center">
    <a href="https://github.com/yuanweize/DiabetesKit/actions/workflows/build-and-release.yml"><img src="https://github.com/yuanweize/DiabetesKit/actions/workflows/build-and-release.yml/badge.svg" alt="构建状态"></a>
    <a href="https://github.com/yuanweize/DiabetesKit/releases/latest"><img src="https://img.shields.io/github/v/release/yuanweize/DiabetesKit?label=%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC" alt="最新版本"></a>
    <a href="LICENSE"><img src="https://img.shields.io/github/license/yuanweize/DiabetesKit" alt="许可证"></a>
  </p>
  <p align="center">
    <a href="README.md">🇬🇧 English</a> ·
    <a href="https://github.com/yuanweize/DiabetesKit/releases/latest">📥 下载 PDF</a> ·
    <a href="https://github.com/yuanweize/DiabetesKit/issues">🐛 反馈问题</a>
  </p>
</p>

---

## 📥 快速下载

> **无需任何安装！** 下载 PDF，打印出来，即可开始记录。

| 模板 | 中文 | English |
|------|:---:|:---:|
| 🩸 血糖监测记录表 | [下载 PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/blood-glucose-log_zh.pdf) | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/blood-glucose-log_en.pdf) |

> **打印设置：** A4 纸张，**横向**打印，100% 缩放。

---

## 💡 关于本项目

DiabetesKit 是一个开源的**可打印健康管理工具集**，专为**二型糖尿病患者**设计。我们的目标是让日常健康追踪尽可能简单——特别是对老年用户友好。

### 设计理念

- **✨ 简洁至上** — 最少的字段，最大的清晰度，老年人也能轻松填写
- **🖨️ 即印即用** — 专业 PDF 输出，针对 A4 纸张优化
- **🌍 多语言支持** — 模板支持多种语言
- **🔧 易于扩展** — 轻松添加新模板和新语言

### 可用模板

#### 🩸 血糖监测记录表

用于记录每日血糖的月度记录表。

| 字段 | 说明 |
|------|------|
| 日期 (1-31) | 预填整月 31 天 |
| 时间点 | 空腹 / 早餐后 / 午餐后 / 晚餐后 / 睡前 |
| 血糖值 (mmol/L) | 血糖读数 |
| 用药 | 简单标注 ✓ 或 ✗ |
| 备注 | 饮食、运动或身体感受 |

底部包含**月度小结**区域和**参考范围**。

---

## 🏗️ 项目结构

```
DiabetesKit/
├── templates/                  # 📋 可打印模板
│   └── blood-glucose-log/      #    血糖监测记录表
│       ├── zh/                  #      中文版
│       └── en/                  #      英文版
├── scripts/                    # 🔧 构建工具
│   └── md2pdf.sh               #    Markdown → PDF 转换脚本
├── .github/workflows/          # 🚀 CI/CD 流水线
│   └── build-and-release.yml   #    自动构建与发布 PDF
├── output/                     # 📦 构建产物（已 gitignore）
├── Makefile                    # 🎯 构建入口
├── CONTRIBUTING.md             # 🤝 贡献指南
├── CHANGELOG.md                # 📝 版本历史
└── LICENSE                     # ⚖️ MIT 许可证
```

> **想添加新工具？** 只需在 `templates/` 下创建新目录，添加 `.md` 文件，然后在 `Makefile` 中注册即可。详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## 🔨 本地构建

### 前置条件

| 工具 | 用途 | 安装方法 |
|------|------|----------|
| [Pandoc](https://pandoc.org/installing.html) | 文档转换器 | `brew install pandoc` |
| [XeLaTeX](https://www.tug.org/texlive/) | 支持中文的 PDF 引擎 | `brew install --cask mactex` |

### 构建命令

```bash
# 克隆仓库
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit

# 构建所有 PDF
make all

# 仅构建指定语言
make zh    # 仅中文
make en    # 仅英文

# 清理构建产物
make clean

# 查看帮助
make help
```

构建好的 PDF 文件在 `output/` 目录下。

---

## 🚀 CI/CD 自动化

本项目使用 **GitHub Actions** 自动构建和发布 PDF：

1. **触发**：推送版本标签（如 `git tag v1.0.0 && git push --tags`）
2. **构建**：使用 Pandoc + XeLaTeX 编译所有模板为 PDF
3. **发布**：创建 GitHub Release，所有 PDF 作为可下载附件

---

## 🤝 参与贡献

我们欢迎各种形式的贡献！包括但不限于：
- 🌍 **翻译** — 添加您的语言
- 📋 **新模板** — 血压记录、用药追踪等
- 🐛 **修复问题** — 报告或修复错误
- 📖 **完善文档** — 改进使用指南

详细说明请参阅 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## ❤️ 项目缘起

这个项目源于一个真实的需求——帮助一位 79 岁的奶奶管理她的二型糖尿病，用一张简单的、可打印的血糖记录表。我们相信健康管理工具应该是**免费的**、**无障碍的**、**易于使用的**，无论年龄或技术水平。

如果这个项目帮助了您或您关心的人，请考虑 ⭐ 给项目点个星，并分享给可能受益的人。

---

## 📄 许可证

本项目基于 [MIT 许可证](LICENSE) 开源——可免费用于个人和商业用途。
