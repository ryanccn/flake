{pkgs}: {
  system.activationScripts.extraActivation = {
    text = ''
      set -eo pipefail
      HOME="/var/root" ${pkgs.lib.getExe pkgs.nvd} --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };
}
