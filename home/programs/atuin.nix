_: {
  programs.atuin = {
    enable = true;

    enableBashIntegration = false;
    enableFishIntegration = true;
    enableZshIntegration = true;
    flags = ["--disable-up-arrow"];

    settings = {
      update_check = false;
      history_filter = [
        "^clear"
        "^exit"
      ];
    };
  };
}
