# configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel params
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # firmware
  hardware.enableAllFirmware = true;

  # hostname
  networking.hostName = "nixbox";

  # networking
  networking.networkmanager.enable = true;
  
  # udisks2
  services.udisks2.enable = true;
  
  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # auto-update
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  #nix-optimise
  nix.optimise.automatic = true;

  #gc
  nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 7d";
  };

  # time zone
  time.timeZone = "Europe/London";

  # international properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # keymap 
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # user
  users.users.zero = {
    isNormalUser = true;
    description = "zero";
    extraGroups = [ "networkmanager" "wheel" "seat" ];
    packages = with pkgs; [];
  };

  # unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # pkgs
  environment.systemPackages = with pkgs; [
     efibootmgr
     udiskie
     neovim
     python3Minimal
     wget
     curl
     git
     tmux
     podman-compose
     wl-clipboard
     grim
     acpi
     alsa-utils
     librewolf
     mpv
     fastfetch
     htop
     iftop
  ];

 # sway
 programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

 # seatd
 services.seatd.enable = true;
 
 # pipewire
 security.rtkit.enable = true;
 services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
 
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
 
 # ssh 
 services.openssh.enable = true;

 # podman
 virtualisation.podman.enable = true;

 system.stateVersion = "25.05";

}
