_: {
  programs.go = {
    enable = true;
    goPath = ".go";
  };

  home.file."Library/Application Support/go/env".text = ''
    GOTOOLCHAIN=path
    GOPROXY=direct
  '';
}
