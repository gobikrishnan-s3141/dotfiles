# Nixos
*everything is a f(x)* 
![image](https://github.com/user-attachments/assets/aa7d280c-360e-4305-b0ab-1b95efad6536)

- [I use nix BTW](https://nixos.org/)
- Download the latest iso from this [site](https://nixos.org/download/)
- [Installation guide]()

## minimal wayland setup
- **minimal nixos base**
- **wm:** `sway`
- **terminal:** `foot`
- **term font:** `monospace`
- **font:** `freesans`

## setup
- use `configuration.nix` file from the repo and rebuild the system
 -      sudo nixos-rebuild switch --upgrade
or (more verbose)
 -      sudo nix-channel --update
        sudo nixos-rebuild switch

- nix-shell (temp installation/testing)
 -      sudo nix-shell -p $nixpkg

- `Firefox` (if you wanna use good old firefox, do not use the stock version; I recommend using a custom 'user.js' from [arkenfox](https://github.com/arkenfox/user.js/) for enhanced security or [Betterfox](https://github.com/yokoffing/BetterFox) for a sweetspot between ease of use and better security.

- Looking for chromium-based browsers, install `Brave` or `chromium`.

- Enjoy some cool memes(no offence to any distros)
![image](https://github.com/user-attachments/assets/54045c49-0f05-4a92-94cb-e542cb9c5126)
![image](https://github.com/user-attachments/assets/3c04ece1-ee0b-4439-832f-c080eff5bf2d)
![image](https://github.com/user-attachments/assets/7b8b54ff-7917-4093-ab54-6c66b92201fa)

**Feel free to use the config files**
