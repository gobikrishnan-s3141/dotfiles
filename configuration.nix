# configuration.nix

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel params
  boot.kernelPackages = pkgs.linuxPackages;

  # firmware
  hardware.firmware = with pkgs; [
    linux-firmware
    ];
  nixpkgs.config.allowUnfree = true;

  # hostname 
  networking.hostName = "nixbox";

  # NetworkManager
  networking.networkmanager.enable = true;

  #firewall
  networking.firewall.enable = true;

  # time zone
  time.timeZone = "UTC";

  # system locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = lib.mkDefault "us";
     useXkbConfig = true;
   };
 
  # flakes
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    cores = lib.mkDefault 4;
    max-jobs = lib.mkDefault 4;
    auto-optimise-store = true;
    };

  # auto-update
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--recreate-lock-file"
      "-L" # print build logs
    ];
  };

  # gc
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
    };

  # udisks2
  services.udisks2.enable = true;

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
     enable = true;
     alsa.enable = true;
     pulse.enable = true;
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
     alsa-utils
     pciutils
     usbutils
     librewolf
     mpv
     fastfetch
     htop
     iftop
   ];

  # default editor
  environment.variables.EDITOR = "nvim";

  # gnupg & mtr
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
  programs.mtr.enable = true;

  # sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    };
  security.pam.services.swaylock = {};

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

  system.stateVersion = "25.11";

}
