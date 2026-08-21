# dsh-web-basic

English | 中文（见下文）

The basic community bundle for the [dsh](https://github.com/deepseek-ai/deepseek-harness) web GUI — the quality-of-life plugins most users want, installable as one profile. Every member plugin can also be installed, removed, or toggled individually; the bundle is a starting point, not a lock-in.

> **Status**: the member plugins are being published to npm now (first wave). The profile template below becomes installable once they land — watch this repo.

## What's in it

| Plugin | What you get |
|---|---|
| `dsh-client-message-tools` | Edit / withdraw / restore user messages in place |
| `dsh-message-timeline` | A hoverable timeline rail over long conversations — jump to any user message |
| `dsh-client-session-title-edit` | Inline session-title editing in the chat header |
| `dsh-client-ui-file-preview` + `dsh-file-preview` | A "产物/Produced" tab and drawer previewing every file the session wrote |
| `dsh-taskpilot` | Background-job and subagent pills above the composer, with stop/interrupt |
| `dsh-context-guard` | A compact button appears before context overflow rejects your request |
| `dsh-ui-shortcuts` | Pause / steer-send / new-session keyboard shortcuts, rebindable |
| `dsh-whalesong` | Status ambience: favicon animation, sidebar droplets, completion chimes |

Not included on purpose: `dsh-ankh-guard` (ops tooling for self-hosted instances) and the `dsh-local-agent` family (local CLI delegation — install separately if you want it).

## Install (once members are on npm)

```sh
# 1. get the template
git clone https://github.com/Khorsheed/dsh-web-basic.git
# 2. drop it into your dsh home and install
cp -r dsh-web-basic/profiles/web-basic "$DSH_HOME/profiles/"
dsh plugin --profile web-basic install
# 3. boot it
dsh --profile web-basic
```

Remove any member with `dsh plugin --profile web-basic remove @khorsheed/dsh-<name>` — the rest keep working.

## Developing

The plugins live in [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins) (the single source of truth). This repo contains only the profile template and docs — no plugin code. Version bumps happen when members are added/removed or cross a major line.

---

## 中文

dsh web GUI 的基础社区整合包——大多数用户都想要的质量改进插件，一个 profile 装齐。每个成员插件都可以单独安装、移除或开关：整合包是起点，不是绑定。

> **状态**：成员插件正在首发 npm（第一波）。模板在成员上架后可装——关注本仓。

### 安装（成员上架后）

```sh
git clone https://github.com/Khorsheed/dsh-web-basic.git
cp -r dsh-web-basic/profiles/web-basic "$DSH_HOME/profiles/"
dsh plugin --profile web-basic install
dsh --profile web-basic
```

任何成员都可以单独移除：`dsh plugin --profile web-basic remove @khorsheed/dsh-<名字>`，其余不受影响。

插件源码在 [Khorsheed/dsh-plugins](https://github.com/Khorsheed/dsh-plugins)；本仓只有 profile 模板与文档。
