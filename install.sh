#!/bin/bash
# ═══ 式神召喚術 ── Shikigami Installer ═══
#
# Usage:
#   ./install.sh              # 預設中文 (default: Chinese)
#   ./install.sh --lang zh    # 繁體中文
#   ./install.sh --lang en    # English
#   ./install.sh --help       # 顯示說明

set -e

LANG_CHOICE="zh"
INSTALL_DIR="${HOME}/.claude/skills/shikigami"

# ── Parse arguments ──
while [[ $# -gt 0 ]]; do
    case $1 in
        --lang)
            LANG_CHOICE="$2"
            shift 2
            ;;
        --dir)
            INSTALL_DIR="$2"
            shift 2
            ;;
        --help|-h)
            cat <<'HELP'
⛩ Shikigami Installer

Usage:
  ./install.sh [OPTIONS]

Options:
  --lang <zh|en>    選擇語言 / Choose language (default: zh)
                      zh = 繁體中文
                      en = English
  --dir <path>      安裝路徑 / Install path (default: ~/.claude/skills/shikigami)
  --help, -h        顯示此說明 / Show this help

Examples:
  ./install.sh                    # 中文安裝
  ./install.sh --lang en          # English installation
  ./install.sh --lang zh --dir .  # 安裝至當前目錄
HELP
            exit 0
            ;;
        *)
            echo "Unknown option: $1 (use --help for usage)"
            exit 1
            ;;
    esac
done

if [[ "$LANG_CHOICE" != "zh" && "$LANG_CHOICE" != "en" ]]; then
    echo "Error: --lang must be 'zh' or 'en'"
    exit 1
fi

# ── Detect script directory (source files) ──
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "        ⛩"
echo "  ══════╪══════"
echo "  ║           ║"
echo "  ║           ║"
echo " ╱  SHIKIGAMI  ╲"
echo "╱═══════════════╲"
echo ""

if [[ "$LANG_CHOICE" == "zh" ]]; then
    echo "🌸 語言：繁體中文"
else
    echo "🌸 Language: English"
fi
echo "📂 Install: $INSTALL_DIR"
echo ""

# ── Create directory structure ──
mkdir -p "$INSTALL_DIR/shrine"
mkdir -p "$INSTALL_DIR/ofuda"
mkdir -p "$INSTALL_DIR/formation"
mkdir -p "$INSTALL_DIR/contract"
mkdir -p "$INSTALL_DIR/references"

# ── Helper: copy with language selection ──
# For files that have .en.md variants, pick the right one
install_file() {
    local src_base="$1"    # e.g. shrine/summon
    local dest="$2"        # e.g. shrine/summon.md

    if [[ "$LANG_CHOICE" == "en" && -f "$SCRIPT_DIR/${src_base}.en.md" ]]; then
        cp "$SCRIPT_DIR/${src_base}.en.md" "$INSTALL_DIR/${dest}"
    else
        cp "$SCRIPT_DIR/${src_base}.md" "$INSTALL_DIR/${dest}"
    fi
}

# ── Install core files ──

# Skill file (binary, no language variant)
cp "$SCRIPT_DIR/shikigami.skill" "$INSTALL_DIR/shikigami.skill"

# Shrine
install_file "shrine/summon" "shrine/summon.md"
install_file "shrine/taboo" "shrine/taboo.md"
install_file "shrine/goshuincho" "shrine/goshuincho.md"

# Contract
install_file "contract/templates" "contract/templates.md"

# Formation
install_file "formation/formations" "formation/formations.md"

# Ofuda (index has language variant, individual ofuda are bilingual)
install_file "ofuda/README" "ofuda/README.md"
for f in self-check progress thinking sandbox verbose-log strict-mode; do
    cp "$SCRIPT_DIR/ofuda/${f}.md" "$INSTALL_DIR/ofuda/${f}.md"
done

# README
install_file "README" "README.md"

# ── Create backward-compatible symlinks ──
# The .skill file may reference these paths
ln -sf shrine/summon.md "$INSTALL_DIR/SKILL.md"
ln -sf ../contract/templates.md "$INSTALL_DIR/references/templates.md"
ln -sf ../formation/formations.md "$INSTALL_DIR/references/formations.md"

# ── Done ──
echo ""
FILE_COUNT=$(find "$INSTALL_DIR" -type f | wc -l | tr -d ' ')

if [[ "$LANG_CHOICE" == "zh" ]]; then
    echo "✅ 式神召喚術安裝完成！"
    echo "   已安裝 ${FILE_COUNT} 個檔案至 $INSTALL_DIR"
    echo ""
    echo "📖 使用方式："
    echo "   1. 在 Claude Code 中說「召喚式神」"
    echo "   2. 或直接輸入 /shikigami"
    echo ""
    echo "⛩ 願術法精進，式神聽令。"
else
    echo "✅ Shikigami Summoning Arts installed!"
    echo "   ${FILE_COUNT} files installed to $INSTALL_DIR"
    echo ""
    echo "📖 Usage:"
    echo "   1. In Claude Code, say 'summon a shikigami'"
    echo "   2. Or type /shikigami"
    echo ""
    echo "⛩ May your arts grow ever sharper."
fi
echo ""
