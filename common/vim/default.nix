{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      number = true;
    };

    plugins = [ "vim-nix" ];

    extraConfig = ''
      syntax on
      autocmd Filetype gitcommit setlocal spell textwidth=72'';
  };
}
