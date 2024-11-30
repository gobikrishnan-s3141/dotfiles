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

  networking.hostName = "nixbox";

  # networking
  networking.networkmanager.enable = true;

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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # unfree packages
  nixpkgs.config.allowUnfree = true;

  # pkgs
  environment.systemPackages = with pkgs; [
     neovim
     wget
     curl
     git
     wl-clipboard
     grim
     pkgs.librewolf
     pkgs.mpv
     fastfetch
     htop
  ];

 # sway
 programs.sway.enable = true;
 
 # tlp
 services.tlp.enable = true;

 # ssh 
 services.openssh.enable = true;

 # podman
 virtualisation.podman.enable = true;

 system.stateVersion = "24.05";

}
