# spells
export PATH="${PATH}:${HOME}/.local/bin/"
export JAVA_HOME="/usr/lib/jvm/java-22-openjdk/"

# startup
Hyprland

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
