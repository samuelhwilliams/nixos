{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      vi = "vim";
      ls = "ls -Gfh";
      grep = "grep --color=auto";

      gco = "git checkout";
      gcob = "gco -b";
      gd = "git diff";
      gdc = "git diff --cached";
      gs = "git status";
      gcam = "git commit -a --amend";
      grm = "git rebase master";
      gpo = "git push origin $(get_current_git_branch_name)";
      grho = "git reset --hard origin/$(get_current_git_branch_name)";
      serve = "python -m http.server";
    };

    initExtra = ''
source ${pkgs.gitAndTools.gitFull}/share/git/contrib/completion/git-prompt.sh

eval "$(direnv hook bash)"

function get_current_git_branch_name() {
  echo $(git name-rev --name-only HEAD)
}

${builtins.readFile ./pyautovenv.sh}
      '';

      profileExtra = builtins.readFile ../.profile;
  };
}
