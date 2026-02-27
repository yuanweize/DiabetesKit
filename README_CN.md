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

> **无需安装！** 下载 PDF，A4 横向打印，即可使用。

| 模板 | 中文 | English |
|------|:---:|:---:|
| 🩸 血糖监测记录表 | [下载 PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-zh.pdf) | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-en.pdf) |

---

## 💡 关于

**DiabetesKit** 是一个开源的**可打印健康管理工具集**，为糖尿病患者提供简洁、实用的日常健康追踪工具，特别关注老年用户的使用体验。

> 目前以二型糖尿病管理为主，未来计划扩展支持其他类型及更多健康追踪工具。

### 设计理念

- **✨ 简洁至上** — 大字体、少字段、每月一页
- **🖨️ 即印即用** — 单页 A4 横向 PDF，方便手写记录
- **🤖 AI 友好** — 结构化布局，拍照发给 AI 即可分析当月数据
- **🌍 多语言** — 基于 JSON 的国际化系统，轻松添加新语言
- **🔧 易扩展** — 新增模板只需很少的改动

### 可用模板

#### 🩸 血糖监测记录表

单页月度记录表，包含：

| 列组 | 字段 |
|:---:|---|
| **早 (Morning)** | 空腹 / 早餐后 2h |
| **中 (Noon)** | 午餐前 / 午餐后 2h |
| **晚 (Evening)** | 晚餐前 / 晚餐后 2h |
| **备注** | 用药、饮食、运动、身体状况 |

另含：月度小结区域（可供 AI 分析）、参考范围、紧急联系医生。

---

## 🏗️ 项目结构

```
DiabetesKit/
├── src/                        # 📄 LaTeX 源码
│   └── glucose-record.tex      #    核心模板（语言无关）
├── locales/                    # 🌍 国际化配置（JSON）
│   ├── zh_CN.json              #    中文字符串
│   └── en_US.json              #    英文字符串
├── scripts/                    # 🔧 构建工具
│   └── gen-locale-tex.py       #    JSON → LaTeX 宏定义生成器
├── pdf/                        # 📦 构建产物（已 gitignore）
├── .github/workflows/          # 🚀 CI/CD
│   └── build-and-release.yml   #    自动构建与发布
├── Makefile                    # 🎯 构建入口
├── CONTRIBUTING.md             # 🤝 贡献指南
├── CHANGELOG.md                # 📝 变更日志
└── LICENSE                     # ⚖️ MIT 许可证
```

### 国际化工作原理

```
locales/zh_CN.json  ──→  gen-locale-tex.py  ──→  locale.tex（宏定义）
                                                      ↓
                         src/glucose-record.tex  + locale.tex  ──→  XeLaTeX  ──→  PDF
```

一份 LaTeX 源码，多种语言输出。添加语言 = 一个 JSON 文件 + 一行 Makefile 规则。

---

## 🔨 本地构建

### 前置条件

| 工具 | 用途 | 安装 |
|------|------|------|
| [XeLaTeX](https://www.tug.org/texlive/) | PDF 引擎（CJK 支持）| `brew install --cask mactex` |
| Python 3 | 区域配置脚本 | macOS 自带 |

### 构建

```bash
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit

make all        # 构建所有 PDF
make zh         # 仅中文
make en         # 仅英文
make clean      # 清理构建产物
make help       # 查看帮助
```

---

## 🚀 CI/CD

推送版本标签即可自动构建发布：

```bash
git tag v1.1.0
git push --tags
# → GitHub Actions 构建 PDF → 创建 Release 附带 PDF 下载
```

---

## 🤝 参与贡献

欢迎贡献！详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

**快速贡献方向：**
- 🌍 添加语言（只需创建 `locales/*.json` 文件）
- 📋 新模板（血压记录、用药追踪等）
- 🐛 修复问题和改进

---

## 📄 许可证

[MIT 许可证](LICENSE) — 可免费用于个人和商业用途。
