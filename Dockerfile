FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

ENV TZ="America/Chicago"

# makepkg cannot (and should not) be run as root:
ARG user=makepkg
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user

RUN pacman -Sy --noconfirm base-devel git vim

# Continue execution (and CMD) as makepkg user:
USER $user
WORKDIR /home/$user

# Auto-fetch GPG keys (for checking signatures):
RUN mkdir .gnupg && \
    touch .gnupg/gpg.conf && \
    echo "keyserver-options auto-key-retrieve" > .gnupg/gpg.conf

# Install yay (for building AUR dependencies):
RUN git clone https://aur.archlinux.org/yay-bin.git && \
    cd yay-bin && \
    makepkg --noconfirm --syncdeps --rmdeps --install --clean

RUN yay -Sy --noconfirm hyprland kitty jq mako waybar-hyprland swww swaylock-effects wofi wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar polkit-gnome python-requests pamixer pavucontrol brightnessctl bluez bluez-utils blueman network-manager-applet gvfs thunar-archive-plugin file-roller btop pacman-contrib starship ttf-jetbrains-mono-nerd noto-fonts-emoji lxappearance xfce4-settings sddm-git sddm-sugar-candy-git

COPY /root /













