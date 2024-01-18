#!/bin/bash

# login 
# username: zero
# passwd :*******

su
pacman -S sudo sway swaybg seatd foot bemenu-wayland mpv pipewire-alsa wireplumber alsa-utils iftop htop git acpi tlp curl wget e2fsprogs
useradd -m -g zero wheel,seat
passwd zero
systemctl enable seatd

exit

# dir & aur_helper

mkdir zero
cd zero
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd

reboot
