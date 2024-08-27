# spells
export PATH="${PATH}:${HOME}/.local/bin/"
export JAVA_HOME="/usr/lib/jvm/java-22-openjdk/"
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME="qt6ct"
export ANKI_WAYLAND="1"
export VSCODE_EXTENSIONS="${HOME}/.config/vscode/extensions/"
export VSCODE_APPDATA="${HOME}/.config/vscode/app/"
export VSCODE_USER_DATA="${HOME}/.config/vscode/user/"

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# startup
Hyprland
