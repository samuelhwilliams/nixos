{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Samuel Williams";
    userEmail = "samuelhwilliams@gmail.com";

    ignores = [ ".idea/*" ".vscode" ".cache" "venv*" ".mypy_cache/*" ".envrc" ".DS_Store" "**/.DS_Store" ];

    signing = {
      key = "DD15DA37EC8FF466";
      signByDefault = true;
    };
  };
}
