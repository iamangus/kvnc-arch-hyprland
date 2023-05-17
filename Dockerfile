FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

ENV TZ="America/Chicago"

RUN pacman -Sy --noconfirm hyprland