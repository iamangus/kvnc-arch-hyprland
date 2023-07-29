FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

ENV TZ="America/Chicago"

RUN pacman -Syu --needed --noconfirm git


ARG user=makepkg
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm \
  && cd \
  # Clean up
  && rm -rf .cache yay

RUN yay -S hyprland kitty jq mako waybar-hyprland swww swaylock-effects wofi wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar polkit-gnome python-requests pamixer pavucontrol brightnessctl bluez bluez-utils blueman network-manager-applet gvfs thunar-archive-plugin file-roller btop pacman-contrib starship ttf-jetbrains-mono-nerd noto-fonts-emoji lxappearance xfce4-settings sddm-git sddm-sugar-candy-git

COPY /root /