# Arch linux

![image](https://github.com/user-attachments/assets/5f73d63b-da1b-40fe-8703-f0a30f282633)

- [I use arch BTW](https://archlinux.org/)
- Download the latest iso from this [site](https://geo.mirror.pkgbuild.com/iso/2024.09.01/)
- [Installation guide](https://wiki.archlinux.org/title/Installation_guide)

## minimal wayland setup
- wm: sway
- terminal: foot
- term font: monospace
- font: freesans

## Initial setup
1. Enable dhcpd, as it is disabled by default
'''bash
        systemctl enable dhcpd
        systemctl start dhcpcd     
3. Update the system and install sudo, git & neovim
'''bash
        pacman -Syu
        pacman -S sudo git neovim
5. Allow wheel group to use sudo
'''bash
        visudo
        # Uncomment the following line, and save the file with :wq
        # %wheel ALL=(ALL) ALL
 (**warning!**: resist the urge to use su to execute any command unless you know the consequences)
7. Create <user> and add it to wheel
'''bash
        useradd -m <user>
        usermod -G wheel -a <user>
        passwd <user>

**Feel free to use the config files**
