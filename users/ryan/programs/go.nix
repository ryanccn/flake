# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  programs.go = {
    enable = true;
    goPath = ".local/share/go";
  };

  home.sessionVariables = {
    GOTOOLCHAIN = "local";
    GOPROXY = "direct";
  };
}
