cd /tmp
TARGET_ARCH=$([ "$(dpkg --print-architecture)" = "arm64" ] && echo "arm64" || echo "x64")

# Get latest release version from GitHub API
LATEST_VERSION=$(curl -s https://api.github.com/repos/coder/cursor-arm/releases/latest | grep -Po '"tag_name": "v\K[^"]*')

# Download AppImage
wget -O cursor.AppImage "https://github.com/coder/cursor-arm/releases/download/v${LATEST_VERSION}/cursor_${LATEST_VERSION}_linux_${TARGET_ARCH}.AppImage"
chmod +x cursor.AppImage

# Create installation directory
sudo mkdir -p /opt/cursor
sudo mv cursor.AppImage /opt/cursor/
sudo ln -sf /opt/cursor/cursor.AppImage /usr/local/bin/cursor

# Create desktop entry
mkdir -p ~/.local/share/applications
source ~/.local/share/omakub/applications/Cursor.sh

cd -

# mkdir -p ~/.config/Code/User
# cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
# code --install-extension enkia.tokyo-night
