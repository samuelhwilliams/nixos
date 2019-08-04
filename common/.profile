export PS1='\u:\w\[\033[01;35m\]$(__git_ps1 " [%s]")\[\033[00m\]$ '

export LSCOLORS=ExFxBxDxCxegedabagacad

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
