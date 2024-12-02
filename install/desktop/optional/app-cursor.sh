cd /tmp
TARGET_ARCH=$([ "$(dpkg --print-architecture)" = "arm64" ] && echo "arm64" || echo "x64")

if [ "$TARGET_ARCH" = "arm64" ]; then
    # ARM64 installation
    REPO="coder/cursor-arm"

    # Get latest release version from GitHub API
    LATEST_VERSION=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

    # TODO: Check if the LATEST_VERSION is already installed
    # Properly created AppImage should give Version: ${LATEST_VERSION} in the output of `cursor.AppImage --appimage-version`

    # Check if we already have this version installed
    if [ -f "/opt/cursor/cursor.AppImage" ]; then
        echo "Some version of Cursor is already installed. Skipping download."
    else
        # Download AppImage
        wget -O cursor.AppImage "https://github.com/${REPO}/releases/download/v${LATEST_VERSION}/cursor_${LATEST_VERSION}_linux_${TARGET_ARCH}.AppImage"
        chmod +x cursor.AppImage

        # Create installation directory
        sudo mkdir -p /opt/cursor
        sudo mv cursor.AppImage /opt/cursor/
    fi
else
    # x64 installation
    # TODO: Find and implement the correct repository and download URL for x64 architecture
    echo "x64 architecture installation not yet implemented"
    exit 1
fi

# Create wrapper script
echo '#!/bin/bash
/opt/cursor/cursor.AppImage --no-sandbox "$@"' | sudo tee /opt/cursor/cursor-wrapper.sh > /dev/null
sudo chmod +x /opt/cursor/cursor-wrapper.sh

# Update symlink to use wrapper instead of direct AppImage
sudo ln -sf /opt/cursor/cursor-wrapper.sh /usr/local/bin/cursor

# Create desktop entry
mkdir -p ~/.local/share/applications
source ~/.local/share/omakub/applications/Cursor.sh

cd -

mkdir -p ~/.config/Code/User
cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
# TODO: For now cursor does not support installing extensions from the CLI
#       The current workaround is to install all the themes extensions manually and then switching the themes from Omakub menu should work:
#       - Catppuccin.catppuccin-vsc
#       - sainnhe.everforest
#       - jdinhlife.gruvbox
#       - qufiwefefwoyn.kanagawa
#       - arcticicestudio.nord-visual-studio-code
#       - mvllow.rose-pine
#       - enkia.tokyo-night
# cursor --install-extension enkia.tokyo-night
