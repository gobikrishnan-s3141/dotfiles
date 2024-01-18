#!/bin/bash

# login 
# username: zero
# passwd :*******

su
pacman -S sudo sway swaybg seatd foot bemenu-wayland mpv pipewire-alsa wireplumber alsa-utils iftop htop git acpi tlp curl wget e2fsprogs

useradd -m -g zero wheel,seat

passwd zero


