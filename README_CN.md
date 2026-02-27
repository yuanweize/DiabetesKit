<p align="center">
  <h1 align="center">🩸 DiabetesKit</h1>
  <p align="center">
    为糖尿病患者提供便捷、可打印的健康管理工具
    <br />
    Printable health management tools for diabetes patients
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

**DiabetesKit** 是一个开源的**可打印健康管理工具集**，为糖尿病患者提供简洁、实用的日常追踪记录表。我们的目标是降低日常健康管理的门槛，特别关注老年用户的使用体验。

## 📥 快速下载

> **无需安装！** 下载 PDF，打印在 A4 纸上（竖向），即可让家人开始使用。

| 模板 | 中文 | English |
|------|:---:|:---:|
| 🩸 血糖监测记录表 | [下载 PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-zh.pdf) | [Download PDF](https://github.com/yuanweize/DiabetesKit/releases/latest/download/glucose-record-en.pdf) |

---

## 📝 如何使用（+ AI 分析流程）

### 1. 🩸 血糖监测记录表
这是一份专为老年人设计的单页月度记录表：
- **设计贴心**：超大格子（A4 竖向）、大字体、无多余线条，书写不拥挤。
- **颜色分组**：早（蓝）、中（绿）、晚（紫）三分色，老人一眼就能找对位置。
- **自定义参考值**：针对有合并疾病的老年人，放宽了安全的参考范围，并在底部标红了极其危险的紧急读数。

### 2. 🤖 AI 月度小结分析指南
表格底部的**“月度小结”并不是让患者自己手算的**，而是专为空出来的 **AI 分析区**！

月底结算时，**直接用手机拍下这一整张表格**，发给任意主流 AI（如 ChatGPT, Claude, Kimi 等），并附上我们精心准备的**通用提示词（Prompt）**：

> #### 💡 复制下方提示词发给 AI：
> 
> ```text
> 你好！这是一张本月填写的血糖监测记录表照片。请帮我进行全面的月度分析，并计算出用于填入表格底部“月度小结”的数据。
> 
> 请注意：有些格子可能是空白的（患者忘记测量或漏测），这很正常。请在计算时直接忽略空白格，保证具有容错率，不要报错。
> 
> 请按以下格式输出分析结果：
> 
> ### 1. 月度小结数值（请直接给我最终数字，方便我手写抄录到表格上）：
> - **平均 (Avg)**: [计算本月所有已有记录的平均血糖值，精确到小数点后一位]
> - **最高 (High)**: [找出本月偏高的数值，并说明发生在具体哪一天的哪个时间段]
> - **最低 (Low)**: [找出本月最低的数值，并说明具体发生时间]
> - **低血糖次数 (Hypo Episodes)**: [统计数值 < 3.9 的次数，如果没有则记为 0]
> 
> ### 2. 详细医疗分析与建议（请结合表格上印示的参考范围进行评估）：
> - **整体情况评估**：本月血糖控制得如何？达标情况大概是多少？
> - **发现的规律或问题**：例如“午餐后经常偏高”或“空腹血糖在月末有上升趋势”。请结合表格最后一列的“备注”（如饮食、用药情况）分析可能的深层原因。
> - **未来行动建议**：
>   - 饮食与运动：生活方式上有哪些具化建议？
>   - 医疗建议：现状是否需要调整方案？是否建议患者在下次就诊时跟医生重点讨论药物调整？
> - **健康预警**：如果有发生低血糖的风险、或持续严重的高血糖，请给出严肃的警示。
> ```

AI 返回精确数据后，您只需把数字填入纸质表格底部的格子中存档即可，甚至还能自动生成就诊时给医生参考的专业报告！

---

## ✨ 设计理念

- **极简且极大** — 去除不必要的信息干扰，留最大的面积给数字填涂。
- **零技术门槛的 AI 结合** — 用最传统的笔纸收集记录，用最先进的 AI 搞定总结与预测。
- **多语言架构** — 基于 JSON 的国际化系统，可由开源社区一键添加给全世界的患者用。

---

## 👨‍💻 开发者指南 (Developer Guide)

如果你是一名开发者、设计师或者想翻译这个项目，请看以下部分。本项目使用 `LuaLaTeX` 进行构建。

### 🏗️ 项目结构

```
DiabetesKit/
├── src/glucose-record.tex      # 📄 核心 LaTeX 模板（语言无关）
├── locales/*.json              # 🌍 国际化配置 (zh_CN, en_US)
├── scripts/gen-locale-tex.py   # 🔧 JSON → LaTeX 宏生成器
├── .version                    # 🏷️ 单信源版本号
├── Makefile                    # 🎯 构建入口
└── .github/workflows/          # 🚀 CI/CD 自动发布
```

### 🔨 本地构建要求

- **引擎**: LuaLaTeX （含于 TeX Live / MacTeX，`brew install --cask mactex`）
- **脚本**: Python

### 构建指令 (Make Commands)

通过 `Makefile` 我们提供了极其简单的构建命令：

```bash
git clone https://github.com/yuanweize/DiabetesKit.git
cd DiabetesKit

make all        # 构建所有语言版本的 PDF（默认输出到 pdf/ 目录）
make zh         # 仅构建中文版本 (glucose-record-zh.pdf)
make en         # 仅构建英文版本 (glucose-record-en.pdf)
make clean      # 清理编译过程产生的临时文件和所有 PDF 产物
```

### 🤝 参与贡献

欢迎贡献！详见 [CONTRIBUTING.md](CONTRIBUTING.md)。
- 🌍 **添加语言**：在 `locales/` 下新建 JSON 并将其加入 Makefile，一键汉化/本地化。
- 📋 **新模板建议**：如血压记录、用药打卡跟踪表等。

---

## 📄 许可证

[MIT 许可证](LICENSE)
