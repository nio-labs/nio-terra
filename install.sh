#!/bin/sh
# Nio Terra Fleet Installer (Linux, macOS, WSL)
# One-liner: curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-terra/main/install.sh | bash
set -eu

REPO="nio-labs/nio-terra"
MODEL_REPO="nio-labs/nio-xs-models"
NIOXS_DIR="${HOME}/.nioxs"
MODELS_DIR="${NIOXS_DIR}/models"

echo "🌍 ========================================================"
echo "   Nio Terra: Sovereign Land Fleet Installer"
echo "   Pure-Code Systems Titans & Sub-20ms Code Sprinters"
echo "========================================================"

mkdir -p "${MODELS_DIR}"

# 1. Check if nioxs engine is present
if ! command -v nioxs >/dev/null 2>&1 && ! command -v nio-xs >/dev/null 2>&1; then
    echo "⚙️ nioxs engine not found in PATH."
    echo "📦 Installing NioXS core runtime from nio-labs/nio-xs..."
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.sh | bash || {
            echo "⚠️ Could not auto-install nioxs. Please install manually from https://github.com/nio-labs/nio-xs"
        }
    fi
fi

# 2. Setup Default Terra Models
echo "📦 Configuring Nio Terra models: Cheetah (1.5B), Tiger (3.0B) & Bison (7.0B MoE)..."
echo "ℹ️ Models are hosted at https://github.com/${MODEL_REPO}"
echo ""
echo "✅ Nio Terra configuration initialized!"
echo ""
echo "To pull Cheetah (1.5B Sprinter):"
echo "   nioxs pull cheetah"
echo ""
echo "To pull Tiger (3.0B Vibe Coder):"
echo "   nioxs pull tiger"
echo ""
echo "To pull Bison (7.0B MoE Titan):"
echo "   nioxs pull bison"
echo ""
echo "To run Cheetah:"
echo "   nioxs cheetah \"Write an iterative Rust function for Fibonacci\""
echo ""
echo "To run Tiger (Daily Vibe Coding):"
echo "   nioxs tiger \"Write a thread-safe LRU cache in Rust with tests\""
echo ""
echo "To run Bison with formal invariant verification:"
echo "   nioxs bison \"Implement a zero-allocation lock-free ring buffer in Rust\""
echo "========================================================"
