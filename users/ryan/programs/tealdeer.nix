# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = false;
    settings = {
      display.compact = true;
    };
  };
}
