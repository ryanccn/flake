{pkgs, ...}: let
  aliases = {
    eza = "eza --all --icons";
    ls = "eza";
    ll = "eza -l";
    la = "eza -a";
    lt = "eza --tree";
    lla = "eza -la";
  };
in {
  home.packages = [pkgs.eza];

  programs.bash.shellAliases = aliases;
  programs.zsh.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
}
