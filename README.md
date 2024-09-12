# Arch linux

![image](https://github.com/user-attachments/assets/9ad673aa-d2c5-4486-87b4-e8cfba79b382)

- [I use arch BTW](https://archlinux.org/)
- Download the latest iso from this [site](https://geo.mirror.pkgbuild.com/iso/2024.09.01/)
- [Installation guide](https://wiki.archlinux.org/title/Installation_guide)

## minimal wayland setup
- wm: sway
- terminal: foot
- term font: monospace
- font: freesans

## Initial setup
1. Enable ''dhcpd'', as it is disabled by default

        systemctl enable dhcpd
        systemctl start dhcpcd
   
3. Update the system and install ''sudo'', ''git'' & ''neovim''

        pacman -Syu
        pacman -S sudo git neovim
   
5. Allow wheel group to use ''sudo''

        visudo
        # Uncomment the following line, and save the file with :wq
        # %wheel ALL=(ALL) ALL
   
 (**warning!**: resist the urge to use su to execute any command unless you know the consequences)
7. Create <user> and add it to wheel

        useradd -m <user>
        usermod -G wheel -a <user>
        passwd <user>

8. Install ''paru'' - AUR helper

        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
   
10. Install a web browser
- ''Librewolf'' - a slighly modilfied version of firefox

        paru -S librewolf-bin
  
- ''Firefox'' (if you wanna use plain old firefox, do not use the stock version; use a custom ''user.js'' from [arkenfox](https://github.com/arkenfox/user.js/) or [Betterfox](https://github.com/yokoffing/BetterFox)

- Looking for chromium-based browsers, install ''Brave''.
  
**Feel free to use the config files**
