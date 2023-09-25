_: {
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_NO_INSECURE_REDIRECT = "1";
    HOMEBREW_NO_EMOJI = "1";
  };

  homebrew = {
    enable = true;
    caskArgs.require_sha = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    brews = [
      "pandoc"
    ];

    casks = let
      noQuarantine = name: {
        inherit name;
        args = {
          no_quarantine = true;
        };
      };
    in [
      "blackhole-16ch"
      (noQuarantine "eloston-chromium")
      "sf-symbols"
      "1password/tap/1password-cli"
    ];

    taps = [
      "1password/tap"
      "ryanccn/tap"
    ];
  };
}
