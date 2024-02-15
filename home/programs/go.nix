_: {
  programs.go = {
    enable = true;
    goPath = ".local/share/go";
  };

  home.sessionVariables = {
    GOTOOLCHAIN = "path";
    GOPROXY = "direct";
  };
}
