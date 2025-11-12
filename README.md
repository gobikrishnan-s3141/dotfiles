# Nixos
*everything is a f(x)* 
![image](https://github.com/user-attachments/assets/aa7d280c-360e-4305-b0ab-1b95efad6536)

- [I use nix BTW!](https://nixos.org/)
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
- use `configuration.nix` and `flake.nix` files from the repo and rebuild the system to have a more reproducible build [implement `home-manager` for more reproducibility]

*(automatic updates are enabled, so running these commands are not necesssary on a daily basis)*

**flake**
```
  nix flake update
  nix flake update home-manager [if using home-manager]
```
- Apply the updates
```
sudo nixos-rebuild switch --flake .
```
### Recommended softwares
- `Firefox` --> `Librewolf` (if you wanna use good old firefox, do not use the stock version; I recommend using a custom 'user.js' from [arkenfox](https://github.com/arkenfox/user.js/) for enhanced security or [Betterfox](https://github.com/yokoffing/BetterFox) for a sweetspot between ease of use and better security
- `neovim` - default editor
- `mpv` - media player
- `tmux` - terminal multiplexer

*Feel free to use the config files!!*

## References
1. https://nixos-and-flakes.thiscute.world/
2. https://nix.dev/
