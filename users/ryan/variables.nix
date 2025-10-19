# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ config, ... }:
{
  home.sessionVariables = {
    DO_NOT_TRACK = "1";
    NEXT_TELEMETRY_DISABLED = "1";
    NUXT_TELEMETRY_DISABLED = "1";
    CHECKPOINT_DISABLE = "1";
    DISABLE_TELEMETRY = "YES";
    ASTRO_TELEMETRY_DISABLED = "1";
    WRANGLER_SEND_METRICS = "false";
    HF_HUB_DISABLE_TELEMETRY = "1";
    STORYBOOK_DISABLE_TELEMETRY = "1";

    DENO_NO_UPDATE_CHECK = "1";
    CSC_IDENTITY_AUTO_DISCOVERY = "false";

    COMMA_NIXPKGS_FLAKE = "nixpkgs";
    COMMA_PICKER = "fzf";

    LESSHISTFILE = "${config.xdg.stateHome}/less/history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NPM_CONFIG_INIT_MODULE = "${config.xdg.configHome}/npm/config/npm-init.js";
    NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    FLY_CONFIG_DIR = "${config.xdg.stateHome}/fly";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
    GNUPGHOME = "${config.xdg.dataHome}/gnupg";
  };
}
