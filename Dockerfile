FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

ENV TZ="America/Chicago"

# Generally, refreshing without sync'ing is discouraged, but we've a clean
# environment here.
RUN pacman -Sy --noconfirm hyprland