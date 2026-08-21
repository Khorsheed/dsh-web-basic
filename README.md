# dsh-web-basic

**One profile, and your dsh web GUI feels finished.** Edit or withdraw sent messages, jump through long conversations, preview every file the agent touched, watch background jobs at a glance, get nudged before context runs out — the quality-of-life layer most users reach for first.

<!-- hero screenshot goes here after the first acceptance round -->

English | [中文](#中文)

## Quick start

```sh
git clone https://github.com/Khorsheed/dsh-web-basic.git
sh dsh-web-basic/scripts/install.sh   # copies the profile into $DSH_HOME and installs
dsh --profile web-basic               # boot it
```

> **Status**: member plugins are publishing to npm now (first wave). The installer works as soon as they land — watch this repo.

## What's inside

| Plugin | You get |
|---|---|
| message-tools | Edit / withdraw / restore any message you sent, in place |
| message-timeline | A quiet rail at the conversation's edge — hover, see every message, click to jump |
| session-title-edit | Rename sessions inline, right in the chat header |
| file-preview + ui-file-preview | A "Produced" tab: every file the session wrote, previewed without opening an IDE |
| taskpilot | Background jobs and subagents as pills above the composer — stop or interrupt with one click |
| context-guard | A compact button appears before context overflow rejects your request |
| ui-shortcuts | Esc to pause, Ctrl/Cmd+S to steer-send, Ctrl/Cmd+O for a new session — all rebindable |
| whalesong | The sidebar whale spouts while tasks run; a chime when one finishes |

Not in the box: `dsh-ankh-guard` (ops tooling for self-hosted instances) and the `dsh-local-agent` family (local CLI delegation — powerful, but not for everyone).

## Make it yours

- **Remove a member**: `dsh plugin --profile web-basic remove @khorsheed/dsh-<name>` — the rest keep working. The bundle is a starting point, not a lock-in.
- **Add more**: any `@khorsheed/dsh-*` plugin installs the same way, `dsh plugin --profile web-basic add <name>`.
- **Update**: `dsh plugin --profile web-basic update` pulls the newest versions in the declared ranges.

## Developing

Plugins live in [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins) (single source of truth). This repo carries only the profile template and docs — no plugin code. Issues and suggestions welcome here.

---

## 中文

**一个 profile，让 dsh web GUI 变得完整。** 发出去的消息可以改、可以撤；长对话一键跳转；agent 写过的文件随手预览；后台任务一目了然；上下文快满时有人提醒——大多数用户最先想要的那层体验，一次装齐。

### 快速开始

```sh
git clone https://github.com/Khorsheed/dsh-web-basic.git
sh dsh-web-basic/scripts/install.sh   # 把 profile 拷进 $DSH_HOME 并安装
dsh --profile web-basic               # 启动
```

> **状态**：成员插件正在首发 npm（第一波）。成员上架后安装即可用——关注本仓。

### 包含什么

消息编辑/撤回、消息时间轴、标题内联编辑、会话文件预览（产物 tab + 抽屉）、后台任务胶囊、上下文压缩提醒、快捷键、状态氛围鲸鱼。刻意不收：ankh-guard（自托管运维向）和 local-agent 家族（本地 CLI 委派，按需单装）。

### 按你的方式调整

- **去掉某个成员**:`dsh plugin --profile web-basic remove @khorsheed/dsh-<名字>`，其余照常工作——整合包是起点，不是绑定
- **加装**:任何 `@khorsheed/dsh-*` 插件同样一条 `add` 命令
- **更新**:`dsh plugin --profile web-basic update` 拉取范围内的最新版本

插件源码在 [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins)；本仓只放 profile 模板与文档。欢迎 issue。
