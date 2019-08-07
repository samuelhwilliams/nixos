# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  my-aws-vault = pkgs.aws-vault.overrideAttrs (_: {
    name = "aws-vault-4.6.2";
    version = "4.6.2";
    src = pkgs.fetchFromGitHub {
      owner = "99designs";
      repo = "aws-vault";
      rev = "v4.6.2";
      sha256 = "163zdw99ar2rdmaz05rm52n98901b0sarsmi011ii3y92f0xg2gf";
    };
  });
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Allow unfree packages to be installed (e.g. plex)
  nixpkgs.config.allowUnfree = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sdb";

  # Support NTFS filesystems
  boot.supportedFilesystems = [ "ntfs" ];

  # Define hostname
  networking.hostName = "companion";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_GB.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    parted
    screen
    vim
    wget
    my-aws-vault
  ];

  # List services that you want to enable:
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    ports = [ 22 ];
    openFirewall = true;
    passwordAuthentication = false; 
  };

  services.plex = {
    enable = true;
    openFirewall = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keyFiles = [ ../../keys/yubikey.pub ];
  };


  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
}
