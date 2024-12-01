cat <<EOF >~/.local/share/applications/Cursor.desktop
[Desktop Entry]
Version=1.0
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor/cursor.AppImage --no-sandbox %F
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Cursor.png
Categories=Development;IDE;
StartupNotify=true
MimeType=text/plain;inode/directory;application/x-cursor-workspace;
EOF 