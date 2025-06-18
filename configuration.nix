# configuration.nix

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel params
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # firmware
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  # hostname 
  networking.hostName = "nixbox";

  # NetworkManager
  networking.networkmanager.enable = true;

  # time zone
  time.timeZone = "UTC";

  # system locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = lib.mkDefault "us";
     useXkbConfig = true;
   };
 
  # udisks2
  services.udisks2.enable = true;
  
  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # auto-update
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # nix-optimise
  nix.optimise.automatic = true;

  # gc
  nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 15d";
  };

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
     wireplumber.enable = true;
   };

  # touchpad support
  services.libinput.enable = true;

  # user
  users.users.zero = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager"];
     packages = with pkgs; [
     ];
   };

  # install packages
  environment.systemPackages = with pkgs; [
     efibootmgr
     udiskie
     neovim
     wget
     curl
     python3Minimal
     git
     tmux
     podman-compose
     wl-clipboard
     grim
     mako
     acpi
     librewolf
     mpv
     fastfetch
     htop
     iftop
   ];

  # started in user sessions
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
  
  # sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # xwayland
  programs.xwayland.enable = true;

  # seatd
  services.seatd.enable = true;

  # auto-cpufreq
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "performance";
       turbo = "auto";
    };
  };

  # OpenSSH daemon
  services.openssh.enable = true;

  # podman
  virtualisation.podman.enable = true;

  # backup configuration.nix
  system.copySystemConfiguration = true;

  system.stateVersion = "25.05";

}
