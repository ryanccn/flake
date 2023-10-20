_: {
  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      gcloud.disabled = true;

      bun.format = "[$symbol($version )]($style)";
      cmd_duration.format = "[$duration]($style) ";
      deno.format = "[$symbol($version )]($style)";
      docker_context.format = "[$symbol$context]($style) ";
      git_branch.format = "[$symbol$branch(:$remote_branch)]($style) ";
      golang.format = "[$symbol($version )]($style)";
      nix_shell.format = "[$symbol$state( \($name\))]($style) ";
      nodejs.format = "[$symbol($version )]($style)";
      package.format = "[$symbol$version]($style) ";
      python.format = "[\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style)";
      rust.format = "[$symbol($version )]($style)";

      aws.symbol = "  ";
      bun.symbol = "󰳮 ";
      buf.symbol = " ";
      c.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " 󰌾";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fossil_branch.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = "⌘ ";
      hg_branch.symbol = " ";
      hostname.ssh_symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      pijul_channel.symbol = "🪺 ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      spack.symbol = "🅢 ";

      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        Redox = " ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Windows = "󰍲 ";
      };
    };
  };
}
