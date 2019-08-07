{ config, pkgs, ... }:

{
  imports = [ ../../common/bash ../../common/git ];

  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.direnv
    pkgs.watch
    pkgs.terraform
    pkgs.awscli
    pkgs.aws-vault
  ];

  home.sessionVariables = {
    EDITOR = "vi";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = "_";
  };

  programs.bash.profileExtra = ''
export "GPG_TTY=$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye'';
}
