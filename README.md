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

| 插件 | 你得到 |
|---|---|
| message-tools | 发出去的消息可以原位编辑、撤回、恢复 |
| message-timeline | 会话左缘一条安静的时间轴——悬停展开，点击跳转 |
| session-title-edit | 聊天头部内联重命名会话 |
| file-preview + ui-file-preview | 「产物」tab：会话写过的每个文件，不开 IDE 直接预览 |
| taskpilot | 后台任务与子 agent 变成聊天框上方的胶囊，一键停止/中断 |
| context-guard | 上下文溢出拒绝请求之前，压缩按钮先出现 |
| ui-shortcuts | Esc 暂停、Ctrl/Cmd+S 插队发送、Ctrl/Cmd+O 新会话，键位可改 |
| whalesong | 任务运行时侧栏鲸鱼喷水；完成时一声提示音 |
| ankh-guard | 运维助手：agent 改完代码想重启时，先验证构建与测试再放行，改坏了自动回滚——装插件、升版本搞挂实例的事它兜着 |

每个成员都是独立插件：整合包只是替你一次装好，任何一个都可以单独卸载或加装（见下）。

## 功能展示

### message-tools：消息编辑、撤回与恢复

每条用户消息带复制/编辑/撤回操作行。编辑是原位替换，保存后以新消息重新发送；撤回把消息及其后内容彻底移出模型上下文，折叠成可展开的分隔线；还能一键恢复到对话末尾。

<img src="docs/screenshots/message-actions1.png" width="840" alt="message-tools:用户消息上的操作行">

<img src="docs/screenshots/message-actions2.png" width="840" alt="message-tools:原位编辑并重新发送">

<img src="docs/screenshots/message-actions3.png" width="840" alt="message-tools:撤回前的确认弹窗">

<img src="docs/screenshots/message-actions4.png" width="840" alt="message-tools:撤回后的分隔线与恢复入口">

<img src="docs/screenshots/message-actions5.png" width="840" alt="message-tools:恢复后消息原样回到对话">

### message-timeline：历史消息时间轴

会话左缘一条悬浮时间轴，一行一条用户消息。日常收成一条细线不占视线，悬停展开预览，点击直接把会话滚动到对应消息。

<img src="docs/screenshots/message-timeline1.png" width="840" alt="message-timeline:悬停展开的时间轴">

<img src="docs/screenshots/message-timeline2.png" width="840" alt="message-timeline:日常收成细线">

### session-title-edit：会话标题内联编辑

点击聊天头部标题旁的铅笔，标题本身变成输入框，回车即保存。用户改过的标题会被钉住，不再被自动生成覆盖。

<img src="docs/screenshots/session-title-edit1.png" width="840" alt="session-title-edit:标题旁的内联编辑入口">

<img src="docs/screenshots/session-title-edit2.png" width="840" alt="session-title-edit:直接修改标题，回车保存">

### file-preview + ui-file-preview：会话产物预览

「产物」tab 列出会话写入/编辑过的每个文件，选中即在页面内预览当前内容，还能逐轮回看每次改动的 diff——不用打开 IDE。

<img src="docs/screenshots/file-preview1.png" width="840" alt="file-preview:文件列表与内联预览">

<img src="docs/screenshots/file-preview2.png" width="840" alt="file-preview:每个产物的逐轮改动记录">

<img src="docs/screenshots/file-preview3.png" width="840" alt="file-preview:产物 tab 总览">

### taskpilot：后台任务与子 agent 胶囊

聊天框上方两枚胶囊——「后台任务」和「子 agent」——随时查看运行状态、消耗，一键停止/中断，点开看详情抽屉。

<img src="docs/screenshots/taskpilot1.png" width="840" alt="taskpilot:子 agent 胶囊与展开的列表">

<img src="docs/screenshots/taskpilot2.png" width="840" alt="taskpilot:后台任务胶囊与详情抽屉">

### context-guard：上下文压缩提醒

上下文占用越过你配置的比例时，输入框工具栏自动出现压缩按钮，点击执行官方 /compact——在溢出拒绝请求之前提醒。比例可在设置里按偏好调整（0.01–1）。

<img src="docs/screenshots/context-guard-button.png" width="840" alt="context-guard:输入框上的压缩按钮">

<img src="docs/screenshots/context-guard-settings.png" width="840" alt="context-guard:提醒比例可配置">

### ui-shortcuts：可自定义键位的快捷键

Esc 暂停当前任务、Ctrl/Cmd+S 插队发送草稿、Ctrl/Cmd+O 新建会话。设置里点击键帽即可改键，偏好持久保存。

<img src="docs/screenshots/07-ui-shortcuts.png" width="840" alt="ui-shortcuts:设置里的键位自定义">

### whalesong：任务状态氛围

只要有会话在跑，侧边栏的鲸鱼就喷水、标签页图标跟着动；任务完成或卡住等你时，播一小段提示音。页面活了。

<img src="docs/screenshots/whalesong1.png" width="840" alt="whalesong:任务运行时鲸鱼喷水">

<img src="docs/screenshots/whalesong2.png" width="840" alt="whalesong:完成时提示音与标签页图标变化">

### ankh-guard：运维守护

让 agent 自己改代码、自己重启，还不把服务搞挂：重启前先验证构建与测试（凭证绑定 git HEAD），验证不过就拦下；重启后金丝雀自动激活会话继续验证；起不来自动回滚到已知良好版本。

<img src="docs/screenshots/ankh-guard.JPG" width="840" alt="ankh-guard:一次受守护的重启全过程">

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

| Plugin | What you get |
|---|---|
| message-tools | Edit, withdraw, and restore messages you already sent |
| message-timeline | A quiet timeline on the chat's left edge — hover to expand, click to jump |
| session-title-edit | Rename sessions inline in the chat header |
| file-preview + ui-file-preview | A Produced tab: preview every file the session touched, no IDE needed |
| taskpilot | Background jobs and sub-agents become pills above the composer — stop/interrupt in one click |
| context-guard | A compact button shows up before context overflow starts rejecting requests |
| ui-shortcuts | Esc to pause, Ctrl/Cmd+S to steer-send, Ctrl/Cmd+O for a new session — all rebindable |
| whalesong | Sidebar whale spouts while tasks run; a chime when they finish |
| ankh-guard | Ops assistant: when the agent wants to restart after changing code, it verifies the build and tests first — and rolls back if the boot fails |

Every member is an independent plugin: the pack just installs them together, and each can be removed or added on its own (see below).

### The tour

#### message-tools — edit, withdraw, restore

Every user message carries a copy/edit/withdraw action row. Edits replace in place and re-send as a new message; withdraws remove the message and everything after it from the model's context, folding into an expandable divider; one click restores them to the end of the conversation.

<img src="docs/screenshots/message-actions1.png" width="840" alt="message-tools: the action row on a user message">

<img src="docs/screenshots/message-actions2.png" width="840" alt="message-tools: editing in place and re-sending">

<img src="docs/screenshots/message-actions3.png" width="840" alt="message-tools: the withdrawal confirmation">

<img src="docs/screenshots/message-actions4.png" width="840" alt="message-tools: the divider and restore entry">

<img src="docs/screenshots/message-actions5.png" width="840" alt="message-tools: restored messages return as they were">

#### message-timeline — history at a glance

A floating timeline along the chat's left edge, one row per user message. At rest it is a thin rail out of sight; hover to expand a preview, click to scroll straight to that message.

<img src="docs/screenshots/message-timeline1.png" width="840" alt="message-timeline: expanded on hover">

<img src="docs/screenshots/message-timeline2.png" width="840" alt="message-timeline: at rest, a thin rail">

#### session-title-edit — rename inline

Click the pencil beside the title in the chat header and the title itself becomes an input — Enter saves. A user-set title is pinned and never overwritten by auto-generation.

<img src="docs/screenshots/session-title-edit1.png" width="840" alt="session-title-edit: the inline edit entry">

<img src="docs/screenshots/session-title-edit2.png" width="840" alt="session-title-edit: type and hit Enter">

#### file-preview + ui-file-preview — session artifacts

The Produced tab lists every file the session wrote or edited; select one to preview its current content in-page, or step through every change's diff turn by turn — no IDE needed.

<img src="docs/screenshots/file-preview1.png" width="840" alt="file-preview: file list and inline preview">

<img src="docs/screenshots/file-preview2.png" width="840" alt="file-preview: per-turn change history">

<img src="docs/screenshots/file-preview3.png" width="840" alt="file-preview: the Produced tab overview">

#### taskpilot — pills for background work

Two pills above the composer — background jobs and sub-agents — with live status and cost, one-click stop/interrupt, and a detail drawer.

<img src="docs/screenshots/taskpilot1.png" width="840" alt="taskpilot: the sub-agent pill, expanded">

<img src="docs/screenshots/taskpilot2.png" width="840" alt="taskpilot: the jobs pill and detail drawer">

#### context-guard — compact before you run out

When context occupancy crosses your configured ratio, a compact button appears in the composer toolbar — one click runs the official /compact, before overflow starts rejecting requests. The ratio is yours to tune (0.01–1).

<img src="docs/screenshots/context-guard-button.png" width="840" alt="context-guard: the compact button">

<img src="docs/screenshots/context-guard-settings.png" width="840" alt="context-guard: the configurable ratio">

#### ui-shortcuts — rebindable keys

Esc pauses the current task, Ctrl/Cmd+S steer-sends your draft, Ctrl/Cmd+O starts a new session. Click a keycap in settings to rebind; preferences persist.

<img src="docs/screenshots/07-ui-shortcuts.png" width="840" alt="ui-shortcuts: rebinding keys in settings">

#### whalesong — ambient status

While any session runs, the sidebar whale spouts and the tab icon moves; when a run finishes or stalls waiting for you, a short chime plays. The page feels alive.

<img src="docs/screenshots/whalesong1.png" width="840" alt="whalesong: spouting while tasks run">

<img src="docs/screenshots/whalesong2.png" width="840" alt="whalesong: chime and tab icon on completion">

#### ankh-guard — ops guard

Let the agent change its own code and restart its own service without taking it down: restarts require a green build+test credential bound to the git HEAD; after the restart a canary reactivates the session to keep verifying; repeated boot failures roll back to the last known-good version.

<img src="docs/screenshots/ankh-guard.JPG" width="840" alt="ankh-guard: a guarded restart, end to end">

### Make it yours

- **Remove a member**: `dsh plugin --profile web-basic remove @khorsheed/dsh-<name>` — the rest keep working. The bundle is a starting point, not a lock-in.
- **Add more**: any `@khorsheed/dsh-*` plugin installs with the same `add` command.
- **Update**: `dsh plugin --profile web-basic update` pulls the newest versions in range.

### Developing

Plugins live in [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins) (single source of truth). This repo carries only the profile template and docs. Issues welcome.
