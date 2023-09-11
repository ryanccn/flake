{
  pkgs,
  config,
  ...
}: let
  shellAliases = builtins.mapAttrs (_: alias: alias.command) (import ./aliases.nix);
in {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    syntaxHighlighting.enable = true;

    envExtra = builtins.readFile ./zsh/envExtra.zsh;
    initExtraBeforeCompInit = builtins.readFile ./zsh/initExtraBeforeCompInit.zsh;
    initExtra = builtins.readFile ./zsh/initExtra.zsh;

    inherit shellAliases;

    localVariables = {
      vivid_theme = "catppuccin-${config.catppuccin.flavour}";
    };

    plugins = [
      {
        name = "ohmyzsh-macos";
        file = "plugins/macos.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ohmyzsh";
          repo = "ohmyzsh";
          rev = "38ef5192cb1c43159b516d15ab8fed96f847b36b";
          hash = "sha256-UYi4kEc80LwZRL6BDBuC/QI+5uJLXTe5+KGQKvv/nz4=";
        };
      }
      {
        name = "vivid-zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ryanccn";
          repo = "vivid-zsh";
          rev = "a76616c87821e96ae0cbdfb6bf897bffc170a283";
          hash = "sha256-E00xQMCmOt6fJ+IO/TrpFvskNa9QnDw/6DKR51T7i+8=";
        };
      }
    ];
  };
}
