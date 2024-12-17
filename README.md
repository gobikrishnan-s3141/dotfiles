# Nixos
*everything is a f(x)* 
![image](https://github.com/user-attachments/assets/aa7d280c-360e-4305-b0ab-1b95efad6536)

- [I use nix BTW](https://nixos.org/)
- Download the latest iso from this [site](https://nixos.org/download/)
- [Installation guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
- [Manual](https://nixos.org/manual/nixos/stable/)
- [Nix docs](https://nix.dev/install-nix)

## minimal wayland setup
- **minimal nixos base**
- **wm:** `sway`
- **terminal:** `foot`
- **term font:** `monospace`
- **font:** `freesans`

## setup
- use `configuration.nix` file from the repo and rebuild the system
```
sudo nixos-rebuild switch --upgrade

# apply update after a reboot
sudo nixos-rebuild boot

# test update (not added to bootlog, until it is applied)
sudo nixos-rebuild test
```
or (more verbose)
```
 sudo nix-channel --update
 sudo nixos-rebuild switch
```

- nix-shell (temp installation/testing)
```
sudo nix-shell -p $nixpkg
```

- `Firefox` (if you wanna use good old firefox, do not use the stock version; I recommend using a custom 'user.js' from [arkenfox](https://github.com/arkenfox/user.js/) for enhanced security or [Betterfox](https://github.com/yokoffing/BetterFox) for a sweetspot between ease of use and better security.

- Looking for chromium-based browsers, install `Brave` or `chromium`.

**Feel free to use the config files**
