# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
  inputs,
  ...
}:
let
  pkgs' = inputs.self.packages.${pkgs.stdenvNoCC.hostPlatform.system};
in
{
  home.packages = [
    pkgs.inter
    pkgs.lxgw-wenkai

    (pkgs'.ibm-plex-compat.override {
      families = [
        "sans"
        "serif"
        "mono"
      ];
    })

    pkgs'.ryan-mono-bin
    (pkgs.cascadia-code.override { useVariableFont = true; })
    pkgs.nerd-fonts.symbols-only
  ];
}
