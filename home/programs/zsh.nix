{
  config,
  inputs,
  ...
}: let
  shellAliases = builtins.mapAttrs (_: alias: alias.command) (import ./aliases.nix);
in {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    envExtra = builtins.readFile ./zsh/envExtra.zsh;
    # initExtraBeforeCompInit = builtins.readFile ./zsh/initExtraBeforeCompInit.zsh;
    initExtra = builtins.readFile ./zsh/initExtra.zsh;

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
