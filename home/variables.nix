{ config, ... }:
{
  home.sessionVariables = {
    NEXT_TELEMETRY_DISABLED = "1";
    NUXT_TELEMETRY_DISABLED = "1";
    CHECKPOINT_DISABLE = "1";
    DISABLE_TELEMETRY = "YES";
    ASTRO_TELEMETRY_DISABLED = "1";

    FNM_RESOLVE_ENGINES = "true";
    FNM_COREPACK_ENABLED = "true";

    DENO_NO_UPDATE_CHECK = "1";
    CSC_IDENTITY_AUTO_DISCOVERY = "false";

    LESSHISTFILE = "${config.xdg.stateHome}/less/history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    FLY_CONFIG_DIR = "${config.xdg.stateHome}/fly";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
  };
}
