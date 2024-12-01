cd /tmp
TARGET_ARCH=$([ "$(dpkg --print-architecture)" = "arm64" ] && echo "arm64" || echo "x64")

# Get latest release version from GitHub API
LATEST_VERSION=$(curl -s https://api.github.com/repos/coder/cursor-arm/releases/latest | grep -Po '"tag_name": "v\K[^"]*')

wget -O cursor.tar.gz "https://github.com/coder/cursor-arm/releases/download/v${LATEST_VERSION}/cursor_${LATEST_VERSION}_linux_${TARGET_ARCH}.tar.gz"
tar -xf cursor.tar.gz cursor
sudo install -y ./cursor.deb
rm cursor.deb
cd -

# mkdir -p ~/.config/Code/User
# cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
# code --install-extension enkia.tokyo-night
