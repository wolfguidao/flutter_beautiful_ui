# CRM Woorkroom

一个使用 Flutter 构建的高保真 CRM 系统 UI 界面。本项目旨在展示现代化、专业且极具美感的业务管理界面设计，包含项目追踪、即时通讯、考勤管理等多个功能模块的 UI 还原。

## UI 概览

该系统由多个精心打磨的屏幕组成：

1. **登录界面**：极简的身份验证，配备丝滑的加载动画。
2. **仪表板**：核心业务数据与近期活动一目了然。
3. **项目管理**：支持多视图切换的功能中心，助力任务推进。
4. **日历**：团队日程规划与重要节点追踪。
5. **即时通讯**：高性能的聊天系统，保持团队连接。
6. **假期管理**：直观的员工考勤与请假审批流程。
7. **门户**：有序的文件系统与共享资源库。
8. **个人主页**：个性化设置与用户信息维护。

## 项目结构

代码结构清晰，严格遵循关注点分离原则：

*   `constant/`：存放样式设计令牌（Tokens）、主题方案及 UI 模拟数据。
*   `entity/`：核心业务模型定义（如项目、任务、消息）。
*   `presentation/`：按功能模块划分的 UI 层（Auth, Projects, Messenger 等）。
*   `presentation/widgets/`：系统通用的原子化 UI 组件。

## 设计资源

*   **UI 设计来源**: Figma - CRM Woorkroom (Community)

## UI 展示

| 仪表板 (Dashboard) | 项目管理 (Projects) |
|:---:|:---:|
| <img src="screenshot/dashboard.png" width="400" /> | <img src="screenshot/projects.png" width="400" /> |

| 即时通讯 (Messenger) | 日历 (Calendar) |
|:---:|:---:|
| <img src="screenshot/messenger.png" width="400" /> | <img src="screenshot/calendar.png" width="400" /> |

| 假期管理 (Vacations) | 门户 (Portal) |
|:---:|:---:|
| <img src="screenshot/vacations.png" width="400" /> | <img src="screenshot/protal.png" width="400" /> |

| 认证 (Auth) | 个人主页 (Profile) |
|:---:|:---:|
| <img src="screenshot/auth.png" width="400" /> | <img src="screenshot/profile.png" width="400" /> |

---

## 快速开始

1. **环境准备**: 确保已安装 Flutter。[Flutter 安装指南](https://flutter.dev/docs/get-started/install)
2. **环境配置**:
```bash
git clone https://github.com/JiuShuang/flutter_beautiful_ui
cd crm_woorkroom
flutter pub get
```
3. **运行**:
```bash
flutter run
```

## 依赖项

*   `flutter_svg`: 矢量图渲染支持。
*   `window_manager`: 原生桌面端窗口控制。
