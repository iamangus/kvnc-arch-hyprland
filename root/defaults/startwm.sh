#!/bin/sh

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP=Hyprland

# Wayland stuff
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=gtk2
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export CLUTTER_BACKEND=wayland
export XDG_RUNTIME_DIR=/run/user/$(id -u)

/usr/bin/Hyprland