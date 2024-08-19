# spells
export PATH="${PATH}:${HOME}/.local/bin/"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME="qt6ct"
export ANKI_WAYLAND="1"

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# startup
Hyprland
