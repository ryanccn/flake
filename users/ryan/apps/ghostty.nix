# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  lib,
  config,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    package = null;

    settings = {
      theme = "Catppuccin ${lib.toSentenceCase config.catppuccin.flavor}";
      window-colorspace = "display-p3";

      font-family = "Ryan Term";
      font-size = 14;
      font-feature = [
        "-calt"
        "-dlig"
      ];

      adjust-cell-height = "25%";
      adjust-underline-position = 5;

      command = "/run/current-system/sw/bin/fish -l";

      macos-option-as-alt = true;
      macos-secure-input-indication = false;

      window-step-resize = true;
      window-padding-x = 15;
      window-padding-y = 15;

      keybind = [ "super+backspace=text:\\x15" ];
    };
  };
}
