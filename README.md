# dsh-web-basic

**一个 profile，让 dsh web GUI 变得完整。** 发出去的消息可以改、可以撤；长对话一键跳转；agent 写过的文件随手预览；后台任务一目了然；上下文快满时有人提醒——大多数用户最先想要的那层体验，一次装齐。

<!-- 首轮验收后在这里放主图 -->

中文 | [English](#english)

## 快速开始

```sh
git clone https://github.com/Khorsheed/dsh-web-basic.git
sh dsh-web-basic/scripts/install.sh   # 把 profile 拷进 $DSH_HOME 并安装
dsh --profile web-basic               # 启动
```

> **状态**：成员插件正在首发 npm（第一波）。成员上架后安装即可用——关注本仓。

## 包含什么

| 插件 | 你得到 | 预览 |
|---|---|---|
| message-tools | 发出去的消息可以原位编辑、撤回、恢复 | <img src="docs/screenshots/message-actions1.png" width="240" alt="message-tools"> |
| message-timeline | 会话左缘一条安静的时间轴——悬停展开，点击跳转 | <img src="docs/screenshots/message-timeline1.png" width="240" alt="message-timeline"> |
| session-title-edit | 聊天头部内联重命名会话 | <img src="docs/screenshots/session-title-edit1.png" width="240" alt="session-title-edit"> |
| file-preview + ui-file-preview | 「产物」tab：会话写过的每个文件，不开 IDE 直接预览 | <img src="docs/screenshots/file-preview1.png" width="240" alt="file-preview"> |
| taskpilot | 后台任务与子 agent 变成聊天框上方的胶囊，一键停止/中断 | <img src="docs/screenshots/taskpilot1.png" width="240" alt="taskpilot"> |
| context-guard | 上下文溢出拒绝请求之前，压缩按钮先出现 | <img src="docs/screenshots/context-guard-button.png" width="240" alt="context-guard"> |
| ui-shortcuts | Esc 暂停、Ctrl/Cmd+S 插队发送、Ctrl/Cmd+O 新会话，键位可改 | <img src="docs/screenshots/07-ui-shortcuts.png" width="240" alt="ui-shortcuts"> |
| whalesong | 任务运行时侧栏鲸鱼喷水；完成时一声提示音 | <img src="docs/screenshots/whalesong1.png" width="240" alt="whalesong"> |
| ankh-guard | 运维助手：agent 改完代码想重启时，先验证构建与测试再放行，改坏了自动回滚——装插件、升版本搞挂实例的事它兜着 | — |

每个成员都是独立插件：整合包只是替你一次装好，任何一个都可以单独卸载或加装（见下）。

## 按你的方式调整

- **去掉某个成员**:`dsh plugin --profile web-basic remove @khorsheed/dsh-<名字>`——其余照常工作。整合包是起点，不是绑定
- **加装**:任何 `@khorsheed/dsh-*` 插件同样一条 `add` 命令
- **更新**:`dsh plugin --profile web-basic update` 拉取范围内最新版本

## 开发

插件源码在 [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins)（唯一事实源）。本仓只有 profile 模板与文档，不含插件代码。欢迎 issue。

---

## English

**One profile, and your dsh web GUI feels finished.** Edit or withdraw sent messages, jump through long conversations, preview every file the agent touched, watch background jobs at a glance, get nudged before context runs out — the quality-of-life layer most users reach for first.

### Quick start

```sh
git clone https://github.com/Khorsheed/dsh-web-basic.git
sh dsh-web-basic/scripts/install.sh   # copies the profile into $DSH_HOME and installs
dsh --profile web-basic               # boot it
```

> **Status**: member plugins are publishing to npm now (first wave). The installer works as soon as they land — watch this repo.

### What's inside

| Plugin | What you get | Preview |
|---|---|---|
| message-tools | Edit, withdraw, and restore messages you already sent | <img src="docs/screenshots/message-actions1.png" width="240" alt="message-tools"> |
| message-timeline | A quiet timeline on the chat's left edge — hover to expand, click to jump | <img src="docs/screenshots/message-timeline1.png" width="240" alt="message-timeline"> |
| session-title-edit | Rename sessions inline in the chat header | <img src="docs/screenshots/session-title-edit1.png" width="240" alt="session-title-edit"> |
| file-preview + ui-file-preview | A Produced tab: preview every file the session touched, no IDE needed | <img src="docs/screenshots/file-preview1.png" width="240" alt="file-preview"> |
| taskpilot | Background jobs and sub-agents become pills above the composer — stop/interrupt in one click | <img src="docs/screenshots/taskpilot1.png" width="240" alt="taskpilot"> |
| context-guard | A compact button shows up before context overflow starts rejecting requests | <img src="docs/screenshots/context-guard-button.png" width="240" alt="context-guard"> |
| ui-shortcuts | Esc to pause, Ctrl/Cmd+S to steer-send, Ctrl/Cmd+O for a new session — all rebindable | <img src="docs/screenshots/07-ui-shortcuts.png" width="240" alt="ui-shortcuts"> |
| whalesong | Sidebar whale spouts while tasks run; a chime when they finish | <img src="docs/screenshots/whalesong1.png" width="240" alt="whalesong"> |
| ankh-guard | Ops assistant: when the agent wants to restart after changing code, it verifies the build and tests first — and rolls back if the boot fails | — |

Every member is an independent plugin: the pack just installs them together, and each can be removed or added on its own (see below).

### Make it yours

- **Remove a member**: `dsh plugin --profile web-basic remove @khorsheed/dsh-<name>` — the rest keep working. The bundle is a starting point, not a lock-in.
- **Add more**: any `@khorsheed/dsh-*` plugin installs with the same `add` command.
- **Update**: `dsh plugin --profile web-basic update` pulls the newest versions in range.

### Developing

Plugins live in [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins) (single source of truth). This repo carries only the profile template and docs. Issues welcome.
