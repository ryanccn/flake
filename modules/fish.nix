{ lib, ... }:
{
  # https://github.com/LnL7/nix-darwin/issues/122#issuecomment-2272570087
  programs.fish.loginShellInit =
    let
      dquote = str: "\"" + str + "\"";

      profiles = [
        "/etc/profiles/per-user/$USER" # home-manager profile
        "$HOME/.nix-profile" # non-XDG home profile
        "$(set -q XDG_STATE_HOME; and echo \"$XDG_STATE_HOME\"; or echo \"$HOME/.local/state\")/nix/profile" # XDG home profile
        "/run/current-system/sw" # nix-darwin system profile
        "/nix/var/nix/profiles/default" # system profile
      ];

      makeBinSearchPath = lib.concatMapStringsSep " " (path: (dquote "${path}/bin"));
    in
    ''
      fish_add_path --move --prepend --path ${makeBinSearchPath profiles}
      set fish_user_paths $fish_user_paths
    '';
}
