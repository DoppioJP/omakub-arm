VSCODE_SETTINGS_FILE="~/.config/Code/User/settings.json"

if [ -f "$VSCODE_SETTINGS_FILE" ]; then
  code --install-extension $VSC_EXTENSION >/dev/null
  sed -i "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" $VSCODE_SETTINGS_FILE
fi
