#!/usr/bin/env bash
# 一键克隆大库 + 全部子库
# 用法: bash clone.sh [子库目录] ...
#   无参数 → 拉取全部 8 个子库
#   带参数 → 只拉取指定的子库 (例: bash clone.sh wealth_manage computer_technology)

set -e

REPO_URL="https://github.com/littleyellowbicycle/my_knowlegdebase.git"
TARGET_DIR="${1:-my_knowlegdebase}"

# 已声明的子库 (大库 → 子库 映射)
ALL_SUBS=(
  "wealth_manage"
  "life_plan"
  "life_skills"
  "computer_technology"
  "self_improvement"
  "workspace_skills"
  "social_sciences"
  "openSource_insight"
)

echo ">>> 克隆大库到 ./$TARGET_DIR ..."
git clone "$REPO_URL" "$TARGET_DIR"
cd "$TARGET_DIR"

if [ "$#" -le 1 ]; then
  echo ">>> 初始化并拉取全部子库 ..."
  git submodule update --init --recursive
  echo ">>> ✅ 完成。所有子库已就位："
else
  shift
  echo ">>> 初始化并拉取指定子库: $*"
  git submodule update --init --recursive "$@"
  echo ">>> ✅ 完成。指定子库已就位："
fi

git submodule status | sed 's/^/    /'

cat <<EOF

──────────────────────────────────────────────────
下一步:
  1. 用 Obsidian 打开 ./$TARGET_DIR/<子库名>/  作为独立 vault
     例如: Obsidian → Open folder → 选择 wealth_manage/
  2. 在四层认知引擎项目里设置 KB_ROOT 指向当前操作的子库
     KB_ROOT=$TARGET_DIR/wealth_manage python kb.py ingest -u https://...
──────────────────────────────────────────────────
EOF