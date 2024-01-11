{
  pkgs,
  config,
  ...
}: let
  toml = pkgs.formats.toml {};
in {
  home.file.".cargo/config.toml".source = toml.generate "config.toml" {
    build.target-dir = "${config.home.homeDirectory}/.cargo/target";
  };
}
