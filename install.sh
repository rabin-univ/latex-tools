#!/usr/bin/env bash
set -e

REPO="rabin-univ/latex-tools"
BINARY_NAME="latex-tools"
INSTALL_DIR="$HOME/.local/bin"

echo ""
echo "  LaTeX Tools — by Mahbub Alam Rabin, BUET"
echo "  ──────────────────────────────────────────"
echo "  Installing latex-tools ..."
echo ""

# detect OS and arch
OS="$(uname -s)"
ARCH="$(uname -m)"

if [ "$OS" = "Darwin" ]; then
    if [ "$ARCH" = "arm64" ]; then
        ASSET="latex-tools-macos-arm64"
    else
        ASSET="latex-tools-macos-x86_64"
    fi
elif [ "$OS" = "Linux" ]; then
    ASSET="latex-tools-linux-x86_64"
else
    echo "  ERROR: Unsupported OS: $OS"
    exit 1
fi

# get latest release download URL
API_URL="https://api.github.com/repos/${REPO}/releases/latest"
DOWNLOAD_URL=$(curl -fsSL "$API_URL" \
    | grep "browser_download_url" \
    | grep "$ASSET" \
    | sed 's/.*"browser_download_url": "\(.*\)"/\1/' \
    | head -1)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "  ERROR: Could not find release asset: $ASSET"
    echo "  Check https://github.com/${REPO}/releases"
    exit 1
fi

echo "  Downloading: $ASSET"
curl -fsSL "$DOWNLOAD_URL" -o "/tmp/${BINARY_NAME}"
chmod +x "/tmp/${BINARY_NAME}"

# install to ~/.local/bin (no sudo needed)
mkdir -p "$INSTALL_DIR"
mv "/tmp/${BINARY_NAME}" "${INSTALL_DIR}/${BINARY_NAME}"

# add to PATH if not already there
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ] && ! grep -q 'HOME/.local/bin' "$SHELL_RC"; then
    echo '' >> "$SHELL_RC"
    echo '# latex-tools' >> "$SHELL_RC"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    echo "  Added ~/.local/bin to PATH in $SHELL_RC"
fi

echo ""
echo "  ✓ Installed to ${INSTALL_DIR}/${BINARY_NAME}"
echo ""
echo "  Run this once to activate:"
echo "    source ${SHELL_RC:-~/.zshrc}"
echo ""
echo "  Then use from any LaTeX project folder:"
echo "    latex-tools"
echo ""
