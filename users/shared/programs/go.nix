# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ config, ... }:
{
  programs.go = {
    enable = true;

    env = {
      GOPATH = "${config.xdg.dataHome}/go";
      GOTOOLCHAIN = "local";
      GOPROXY = "direct";
    };
    telemetry.mode = "off";
  };
}
