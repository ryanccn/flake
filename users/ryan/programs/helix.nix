# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  inputs,
  pkgs,
  ...
}:
{
  programs.helix = {
    enable = true;
    package = inputs.self.packages.${pkgs.stdenvNoCC.hostPlatform.system}.helix-with-lsps;
    defaultEditor = true;
  };
}
