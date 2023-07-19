let
  main = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFthNLv08xufLf09hObm+COlDdYDL4WuH9f+PZm54M3I";
in {
  "attic.toml.age".publicKeys = [main];
}
