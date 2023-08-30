_: {
  programs.go = {
    enable = true;
    goPath = ".go";
  };

  home.sessionVariables = {
    GOTOOLCHAIN = "path";
    GOPROXY = "direct";
  };
}
