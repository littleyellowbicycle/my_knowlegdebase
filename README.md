# 知识库大库 · my_knowlegdebase

按主题拆分的 7 个独立 Obsidian vault，通过 `git submodule` 统一管理。

## 子库清单

| 子库 | 仓库 | 主题 |
|---|---|---|
| `wealth_manage/` | [kb repo](https://github.com/littleyellowbicycle/wealth_manage) | 理财 — 量化、社保 |
| `life_plan/` | [kb repo](https://github.com/littleyellowbicycle/life_plan) | 人生规划 — 副业、躺平、保险、考公 |
| `life_skills/` | [kb repo](https://github.com/littleyellowbicycle/life_skills) | 生活技能 — 做饭、健身、摄影、外形、运动、摸鱼 |
| `computer_technology/` | [kb repo](https://github.com/littleyellowbicycle/computer_technology) | 计算机技能 — 软件原理、C++/go/java、刷题、AI、项目、高并发、硬件 |
| `self_improvement/` | [kb repo](https://github.com/littleyellowbicycle/self_improvement) | 自我提升 — 数学、英语、考研、自我训练、自我管理 |
| `workspace_skills/` | [kb repo](https://github.com/littleyellowbicycle/workspace_skills) | 工作技能 — 交际 |
| `social_sciences/` | [kb repo](https://github.com/littleyellowbicycle/social_sciences) | 人文社科 — 段子 |

> 二级分类以**标签**形式管理，LLM 加工时自动生成 `#量化`、`#C++`、`#考研` 等标签，Obsidian 标签面板自动聚合显示，不拆物理目录。

## 每个子库结构

每个子库都是一个独立 Obsidian vault，保留四层结构：

```
<子库>/
├── raw/         # 原料层（不可变原文）
├── processed/   # 加工层（LLM 提炼后阅读笔记）
├── wiki/        # 编译层（自动综述）
├── index/       # 索引层（搜索/QA 用）
└── .obsidian/   # Obsidian 配置
```

## 一键克隆全部

```bash
bash clone.sh
# 等价于: git clone --recursive https://github.com/littleyellowbicycle/my_knowlegdebase.git
```

## 选择性克隆（按需拉取）

```bash
bash clone.sh my_kb wealth_manage computer_technology
# 只拉取大库 + wealth_manage + computer_technology 两个子库
```

## 后续更新

```bash
# 拉取大库最新引用 + 全部子库最新
git pull --recurse-submodules

# 只更新某个子库
cd wealth_manage && git pull
```

## 在 Obsidian 中打开

每个子库都是独立的 Obsidian vault：

```
Obsidian → Open vault as folder → 选择 ./my_knowlegdebase/wealth_manage/
```

不同子库用不同的 vault，配置、插件、布局都独立。

## 与 [四层认知引擎](https://github.com/littleyellowbicycle/my-knowledge-base) 配合

`my-knowledge-base` 是处理流水线项目，对各子库进行摄入/加工/索引/问答：

```bash
# 切换操作的子库
KB_ROOT=my_knowlegdebase/wealth_manage python kb.py ingest -u https://...
KB_ROOT=my_knowlegdebase/wealth_manage python kb.py process --all

# 或在 .env 改 KB_ROOT=my_knowlegdebase/<子库>
```