# e-Robo 钱包

一个基于 Flutter 实现的未来主义风格、AI 驱动的 Web3 钱包 UI。本项目展示了一个现代、美观的用户界面，以机器人插图和清晰的数据可视化为特色。

## UI 概览

本应用包含多个精心打磨的 UI 界面，旨在提供连贯且充满未来感的体验：

1.  **登录界面 (Login)**：独特的入口页面，设有一个大型机器人插图，奠定了应用的基调。
2.  **主页仪表盘 (Home)**：核心枢纽，展示总余额、热门资产以及用于规避损失的 "AI 建议" 卡片。
3.  **市场与洞察 (Market & Insights)**：专门用于市场分析、新闻更新以及详细 "智能顾问" 见解的板块。
4.  **交易历史 (History)**：清晰的过往交易列表视图。
5.  **币种详情 (Coin Details)**：展示单个资产的详细视图，包括图表和特定指标。
6.  **价格预警 (Price Alerts)**：用于设置和管理加密货币价格阈值的界面。

## 项目结构

`lib/` 目录下的代码结构旨在有效地分离关注点：
-   `constant/`：静态数据和配置常量（例如 UI 用的模拟数据）。
-   `entity/`：定义币种、资产和其他业务实体结构的数据模型。
-   `gen/`：自动生成的资源管理代码（图片、字体）。
-   `presentation/`：核心 UI 代码，按功能模块组织（例如 `home`, `login`, `market`）。
    -   每个功能文件夹通常包含主页面和该屏幕专用的组件。
-   `router/`：基于 `go_router` 的导航配置。
-   `widget/`：在不同屏幕间共享的可复用通用组件。

## 设计资源

-   **UI 设计来源**: Figma Community - E-Robo Wallet – Crypto iOS UI Kit (Community)

## UI 展示

本应用采用高质量的 3D 资源来打造引人入胜的用户体验：

| 登录 (Login) | 主页 (Home) | 洞察 (Insights) | 市场 (Market) |
|:---:|:---:|:---:|:---:|
| <img src="screenshot/loginPage.png" width="200" /> | <img src="screenshot/homePage.png" width="200" /> | <img src="screenshot/insightsPage.png" width="200" /> | <img src="screenshot/marketPage.png" width="200" /> |

*（注：这些是应用交互中使用的关键资源。运行应用以查看完整的 UI 组合。）*

## 快速开始

1. **前提条件**：确保您已安装 Flutter。[Flutter 安装指南](https://flutter.dev/docs/get-started/install)
2. **克隆仓库**：
   ```bash
   git clone https://github.com/JiuShuang/flutter_beautiful_ui
   cd flutter_beautiful_ui/E-Robo-Wallet
   ```
3. **安装依赖**：
   ```bash
   flutter pub get
   ```
4. **运行应用**：
   ```bash
   flutter run
   ```

## 依赖项

- `go_router`：用于路由导航。
- `fl_chart`：用于图表和图形。
- `flutter_svg`：用于 SVG 资源渲染。
