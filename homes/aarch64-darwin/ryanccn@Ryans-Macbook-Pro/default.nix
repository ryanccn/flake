{
  config,
  inputs,
  ...
}: {
  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.am.homeManagerModules.default
  ];

  services.am-discord-rich-presence = {
    enable = false;
    logFile = "${config.home.homeDirectory}/Library/Logs/am-discord-rich-presence.log";
  };

  catppuccin.flavour = "frappe";

  home.stateVersion = "23.05";
}
