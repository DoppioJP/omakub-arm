#!/bin/bash

CURSOR_SETTINGS_FILE="$HOME/.config/Cursor/User/settings.json"

if [ -f "$CURSOR_SETTINGS_FILE" ]; then
  # Using the same theme name as VS Code since Cursor is based on VS Code
  sed -i "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" "$CURSOR_SETTINGS_FILE"
fi