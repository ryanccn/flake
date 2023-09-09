{
  pkgs,
  config,
  ...
}: {
  home.sessionVariables = {
    GLAMOUR_STYLE = "${pkgs.ctp-glamour.${config.catppuccin.flavour}}/default.json";
  };
}
