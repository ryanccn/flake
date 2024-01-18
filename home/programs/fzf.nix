_: {
  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    colors = {
      "bg+" = "#414559";
      bg = "#303446";
      "fg+" = "#c6d0f5";
      fg = "#c6d0f5";
      "hl+" = "#e78284";
      hl = "#e78284";
      spinner = "#f2d5cf";
      header = "#e78284";
      info = "#ca9ee6";
      pointer = "#f2d5cf";
      marker = "#f2d5cf";
      prompt = "#ca9ee6";
    };
  };
}
