{ config, pkgs, ... }:

{
  imports = [ ../../common/bash ../../common/git ../../common/vim ];

  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.direnv
    pkgs.watch
    pkgs.terraform
    pkgs.awscli
    pkgs.aws-vault
    pkgs.google-cloud-sdk
  ];

  home.sessionVariables = {
    EDITOR = "vi";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = "_";
  };
}
