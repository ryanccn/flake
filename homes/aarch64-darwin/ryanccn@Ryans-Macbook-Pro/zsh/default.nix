{
  config,
  inputs,
  ...
}: let
  shellAliases = builtins.mapAttrs (_: alias: alias.command) (import ../aliases);
in {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    syntaxHighlighting.enable = true;

    envExtra = builtins.readFile ./envExtra.zsh;
    # initExtraBeforeCompInit = builtins.readFile ./zsh/initExtraBeforeCompInit.zsh;
    initExtra = builtins.readFile ./initExtra.zsh;

    inherit shellAliases;

    localVariables = {
      vivid_theme = "catppuccin-${config.catppuccin.flavour}";
    };

    plugins = [
      {
        name = "ohmyzsh-macos";
        file = "plugins/macos/macos.plugin.zsh";
        src = inputs.ohmyzsh;
      }
      {
        name = "vivid-zsh";
        src = inputs.vivid-zsh;
      }
    ];
  };
}
