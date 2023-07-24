{...}: {
  programs.starship = {
    enable = true;
  };

  home.file.".config/starship.toml".source = ./starship/starship.toml;
}
