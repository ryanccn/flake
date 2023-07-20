{...}: {
  programs.fish = {
    enable = true;
    shellAbbrs = import ./aliases.nix;
  };

  home.file.".config/fish/conf.d" = {
    source = ./fish/conf.d;
    recursive = true;
  };
}
