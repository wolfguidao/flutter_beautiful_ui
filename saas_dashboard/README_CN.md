# SaaS 仪表板

一个使用 Flutter 构建的现代化、全面的 SaaS 仪表板应用程序。该项目展示了一个简洁、专业的用户界面，包含多个管理模块，如分析、调度、消息传递等。

## UI 概览

本应用包含多个精心打磨的 UI 界面，旨在提供连贯的业务管理体验：

1. **登录界面**：具有流畅动画和现代设计元素的简洁身份验证界面。
2. **仪表板**：显示关键指标、最近订单、热销产品和摘要统计的中央枢纽。
3. **数据分析**：包含交互式图表、客户洞察和产品性能指标的综合数据可视化。
4. **发票管理**：具有状态指示器和搜索功能的专业发票跟踪和管理系统。
5. **任务调度**：看板式任务管理，包含待办、进行中和已完成列，用于项目工作流程。
6. **日历**：具有优先级和时间跟踪的事件调度和日历管理界面。
7. **消息传递**：具有会话管理和用户状态指示器的实时消息系统。

## 项目结构

`lib/` 目录下的代码结构旨在有效地分离关注点：

- `constant/`：静态数据和配置常量（例如应用颜色、主题、UI 用的模拟数据）。
- `entity/`：定义分析、日历事件、发票和其他业务实体结构的数据模型。
- `gen/`：自动生成的资源管理代码（图片、字体）。
- `presentation/`：核心 UI 代码，按功能模块组织（例如 `dashboard`、`analytics`、`auth`）。
  - 每个功能文件夹通常包含主页面和该屏幕专用的组件。
- `widget/`：在不同屏幕间共享的可复用通用组件。

## 设计资源

- **UI 设计来源**：Figma - SAAS Dashboard designed by wittyu

## UI 展示

本应用采用专业的深色主题设计来打造引人入胜的业务管理体验：

| 仪表板 | 数据分析 |
|:---:|:---:|
| <img src="screenshot/dashboard.png" width="400" /> | <img src="screenshot/analytics.png" width="400" /> |

| 发票管理 | 任务调度 |
|:---:|:---:|
| <img src="screenshot/invoice.png" width="400" /> | <img src="screenshot/shedule.png" width="400" /> |

| 日历 | 消息 |
|:---:|:---:|
| <img src="screenshot/calendar.png" width="400" /> | <img src="screenshot/message.png" width="400" /> |

*（注：这些是应用中使用的关键界面。运行应用以查看完整的 UI 组合。）*

## 快速开始

1. **前提条件**：确保您已安装 Flutter。[Flutter 安装指南](https://flutter.dev/docs/get-started/install)

2. **克隆仓库**：
```bash
git clone <repository-url>
cd saas_dashboard
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

- `flutter_svg`：用于 SVG 资源渲染。
- `fl_chart`：用于图表和图形。
- `window_manager`：用于桌面窗口管理。