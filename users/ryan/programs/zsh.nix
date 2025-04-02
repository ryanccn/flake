# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  config,
  inputs,
  lib,
  ...
}:
let
  shellAliases = builtins.mapAttrs (lib.const (builtins.getAttr "command")) (import ./aliases.nix);
in
{
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
      vivid_theme = "catppuccin-${config.catppuccin.flavor}";
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
