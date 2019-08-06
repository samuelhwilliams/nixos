{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      number = true;
    };

    plugins = [ "vim-nix" ];
  };

  home.file.".vimrc".text = ''
    syntax on
    autocmd Filetype gitcommit setlocal spell textwidth=72'';
}
