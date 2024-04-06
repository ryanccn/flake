{
  pkgs,
  lib,
  ...
}: let
  extensions = [
    # "antfu.icons-carbon"
    "antfu.unocss"
    "astro-build.astro-vscode"
    "bierner.lit-html"
    "bmalehorn.vscode-fish"
    "bradlc.vscode-tailwindcss"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "charliermarsh.ruff"
    "dbaeumer.vscode-eslint"
    "denoland.vscode-deno"
    "dprint.dprint"
    "dotjoshjohnson.xml"
    # "eamodio.gitlens"
    "editorconfig.editorconfig"
    # "enkia.tokyo-night"
    "esbenp.prettier-vscode"
    "github.vscode-github-actions"
    "graphql.vscode-graphql"
    "graphql.vscode-graphql-syntax"
    "golang.go"
    "griimick.vhs"
    "leonardssh.vscord"
    # "jdinhlife.gruvbox"
    "jnoortheen.nix-ide"
    # "miguelsolorio.symbols"
    "ms-python.isort"
    "ms-python.vscode-pylance"
    "ms-python.python"
    # "mvllow.rose-pine"
    "nvarner.typst-lsp"
    "prisma.prisma"
    "ronnidc.nunjucks"
    "rust-lang.rust-analyzer"
    "sastan.twind-intellisense"
    "skellock.just"
    "svelte.svelte-vscode"
    "tamasfe.even-better-toml"
    "timonwong.shellcheck"
    "unifiedjs.vscode-mdx"
    "usernamehw.errorlens"
    "vue.volar"
    "waderyan.gitblame"
    "xaver.clang-format"
    "yoavbls.pretty-ts-errors"
  ];
in {
  programs.vscode = {
    enable = true;
    package = pkgs.stdenv.mkDerivation {
      pname = "vscode";
      version = "1.87.2";
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out
      '';
    };

    extensions = [];
    mutableExtensionsDir = true;

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Frappé";
      "workbench.iconTheme" = "catppuccin-frappe";
      "workbench.sideBar.location" = "left";
      "workbench.activityBar.location" = "top";

      "symbols.hidesExplorerArrows" = false;

      "catppuccin.boldKeywords" = false;
      "catppuccin.italicKeywords" = true;
      "catppuccin.accentColor" = "sapphire";
      "catppuccin.workbenchMode" = "flat";
      "catppuccin.customUIColors" = {
        "all" = {
          "activityBar.activeBorder" = "accent";
          "statusBarItem.remoteBackground" = "accent";
          "activityBarTop.foreground" = "text";
          "activityBarTop.inactiveForeground" = "subtext1";
          "activityBarTop.activeBorder" = "accent";
          "activityBarTop.dropBorder" = "accent";
        };
      };

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.inputValidation" = false;
      "git.suggestSmartCommit" = false;
      "diffEditor.renderSideBySide" = false;
      "diffEditor.ignoreTrimWhitespace" = false;
      "gitlens.showWelcomeOnInstall" = false;

      "gitblame.inlineMessageEnabled" = true;
      "gitblame.inlineMessageFormat" = "\${author.name} · \${time.ago} · \${commit.summary,120}";

      "editor.fontFamily" = "\"Ryan Mono\", \"Symbols Nerd Font\", \"Apple Color Emoji\", monospace";
      "editor.fontLigatures" = true;
      # "editor.fontLigatures" = "'calt', 'ss01'";
      "editor.fontSize" = 16;
      "editor.lineHeight" = 1.5;
      "editor.cursorSmoothCaretAnimation" = "on";
      # "editor.minimap.renderCharacters" = false;
      "editor.cursorBlinking" = "phase";
      "workbench.editor.highlightModifiedTabs" = true;
      "workbench.editor.empty.hint" = "hidden";

      "editor.inlineSuggest.enabled" = true;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.formatOnSave" = true;

      "terminal.integrated.fontFamily" = "\"Ryan Term\", \"Symbols Nerd Font Mono\", \"Apple Color Emoji\", monospace";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.lineHeight" = 1.5;
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.defaultProfile.osx" = "fish";
      "terminal.integrated.inheritEnv" = false;
      "terminal.integrated.shellIntegration.enabled" = true;

      "editor.defaultFormatter" = "esbenp.prettier-vscode";

      "javascript.preferGoToSourceDefinition" = true;
      "typescript.preferGoToSourceDefinition" = true;
      "typescript.enablePromptUseWorkspaceTsdk" = true;

      "eslint.experimental.useFlatConfig" = true;

      "shellcheck.ignorePatterns".".envrc" = true;
      "tailwindCSS.includeLanguages" = {
        "typescript" = "javascript";
        "typescriptreact" = "javascript";
        "vue-html" = "html";
      };

      "telemetry.telemetryLevel" = "off";
      "workbench.enableExperiments" = false;
      "workbench.settings.enableNaturalLanguageSearch" = false;
      "extensions.ignoreRecommendations" = true;
      "editor.accessibilitySupport" = "off";

      "vscord.status.details.text.editing" = "In {workspace}";
      "vscord.status.details.text.viewing" = "In {workspace}";
      "vscord.status.problems.enabled" = false;
      "vscord.status.state.text.editing" = "Working on {file_name}{file_extension}";
      "vscord.status.buttons.button1.enabled" = false;

      # "gitlens.defaultTimeFormat" = "HH=mm";
      # "gitlens.defaultDateShortFormat" = "YYYY/MM/DD";
      # "gitlens.defaultDateFormat" = null;

      "[python]"."editor.tabSize" = 4;
      "[python]"."editor.defaultFormatter" = "charliermarsh.ruff";
      "[cpp]"."editor.defaultFormatter" = "xaver.clang-format";
      "[toml]"."editor.defaultFormatter" = "tamasfe.even-better-toml";
      "[svelte]"."editor.defaultFormatter" = "svelte.svelte-vscode";
      "[go][go.mod][go.sum]"."editor.defaultFormatter" = "golang.go";
      "[xml]"."editor.defaultFormatter" = "DotJoshJohnson.xml";
      "[fish]"."editor.defaultFormatter" = "bmalehorn.vscode-fish";
      "[just]"."editor.defaultFormatter" = "skellock.just";
      "[mdx]"."editor.wordWrap" = "on";
      "[astro]"."editor.defaultFormatter" = "astro-build.astro-vscode";

      "[rust]"."editor.tabSize" = 4;
      "[rust]"."editor.defaultFormatter" = "rust-lang.rust-analyzer";
      "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.showUnlinkedFileNotification" = false;

      "files.associations" = {
        "*.mcmeta" = "json";
        "*.plist" = "xml";
        ".dockerignore" = "ignore";
        ".dev.vars" = "properties";
        ".env.example" = "properties";
        "*.sarif" = "json";
        ".tokeignore" = "ignore";
        "flake.lock" = "json";
      };

      "svelte.enable-ts-plugin" = true;

      "clang-format.executable" = "${pkgs.clang-tools}/bin/clang-format";

      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.serverSettings" = {
        nil = {
          formatting = {
            command = ["${pkgs.alejandra}/bin/alejandra"];
          };
        };
      };

      "typst-lsp.exportPdf" = "never";
      "typst-lsp.experimentalFormatterMode" = "on";
      "[typst]"."editor.defaultFormatter" = "nvarner.typst-lsp";
    };
  };

  home.activation = {
    vscodeExtensions = lib.hm.dag.entryAfter ["writeBoundary"] ''
      code_bin="/usr/local/bin/code"

      if ! command -v "$code_bin" &> /dev/null; then
        echo "code CLI is not available"
        exit 0
      fi

      declare -A currentExtensions
      for extension in $("$code_bin" --list-extensions); do
        currentExtensions["$extension"]=1;
      done

      ${builtins.concatStringsSep
        "\n"
        (
          builtins.map
          (ext: ''
            if [[ -z "''${currentExtensions[${ext}]+unset}" ]]; then
              echo "installing ${ext}"
              $DRY_RUN_CMD "$code_bin" --install-extension ${ext} &> /dev/null
            fi
            unset 'currentExtensions[${ext}]'
          '')
          extensions
        )}

      for ext in "''${!currentExtensions[@]}"; do
        echo "uninstalling $ext"
        $DRY_RUN_CMD "$code_bin" --uninstall-extension $ext &> /dev/null
        unset 'currentExtensions[$ext]'
      done
    '';
  };
}
