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
echo "📦 Configuring Nio Terra models: Cheetah (1.5B), Tiger (3.0B), Fox (3.0B) & Rabbit (3.0B)..."
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
echo "To pull Fox (3.0B Articulate Mentor):"
echo "   nioxs pull fox"
echo ""
echo "To pull Rabbit (3.0B Deep Thinker):"
echo "   nioxs pull rabbit"
echo ""
echo "To run Cheetah (Instant Reflex):"
echo "   nioxs cheetah \"Write an iterative Rust function for Fibonacci\""
echo ""
echo "To run Tiger (Daily Vibe Coding):"
echo "   nioxs tiger \"Write a thread-safe LRU cache in Rust with tests\""
echo ""
echo "To run Fox (Articulate Mentor & Rubber Duck):"
echo "   nioxs fox \"Explain how an atomic CAS loop works and where to use it\""
echo ""
echo "To run Rabbit with formal invariant verification (<think>):"
echo "   nioxs rabbit \"Diagnose memory leak and lock convoy in async broadcast channel\""
echo "========================================================"
