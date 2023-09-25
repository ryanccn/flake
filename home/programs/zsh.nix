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
          rev = "1c55a0fe5246487ec9f18e03b7f28862b76cb7ab";
          hash = "sha256-TPHdGOQI0hAsduu2UPHZy0lBf1G8+5PCbpE8R5PQglM=";
        };
      }
      {
        name = "vivid-zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ryanccn";
          repo = "vivid-zsh";
          rev = "c970eaaf90788c0e75e2a96159953f0f0c2a1b5a";
          hash = "sha256-HL4QQY1QMhTw76u/xbBzodViDAMjKhRhmVXptO7qKqY=";
        };
      }
    ];
  };
}
