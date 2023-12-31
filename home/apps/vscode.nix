{
  pkgs,
  lib,
  ...
}: let
  extensions = [
    "antfu.unocss"
    "astro-build.astro-vscode"
    "bierner.lit-html"
    "bmalehorn.vscode-fish"
    "bradlc.vscode-tailwindcss"
    "Catppuccin.catppuccin-vsc"
    "Catppuccin.catppuccin-vsc-icons"
    "xaver.clang-format"
    "charliermarsh.ruff"
    "csstools.postcss"
    "denoland.vscode-deno"
    "dbaeumer.vscode-eslint"
    "dprint.dprint"
    "DotJoshJohnson.xml"
    "EditorConfig.EditorConfig"
    "eamodio.gitlens"
    "github.vscode-github-actions"
    "esbenp.prettier-vscode"
    "GraphQL.vscode-graphql"
    "GraphQL.vscode-graphql-syntax"
    "golang.go"
    "griimick.vhs"
    "LeonardSSH.vscord"
    "jnoortheen.nix-ide"
    "ms-python.isort"
    "ms-python.vscode-pylance"
    "ms-python.python"
    "mvllow.rose-pine"
    "Prisma.prisma"
    "nvarner.typst-lsp"
    "ronnidc.nunjucks"
    "rust-lang.rust-analyzer"
    "tamasfe.even-better-toml"
    "sastan.twind-intellisense"
    "skellock.just"
    "svelte.svelte-vscode"
    "timonwong.shellcheck"
    "unifiedjs.vscode-mdx"
    "Vue.volar"
    "yoavbls.pretty-ts-errors"
  ];
in {
  programs.vscode = {
    enable = true;
    package = pkgs.stdenv.mkDerivation {
      pname = "vscode";
      version = "1.81.2";
      src = pkgs.emptyDirectory;
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

      "catppuccin.boldKeywords" = false;
      "catppuccin.italicKeywords" = true;
      "catppuccin.accentColor" = "sky";
      "catppuccin.workbenchMode" = "default";
      "catppuccin.customUIColors" = {
        "all" = {
          "activityBar.activeBorder" = "accent";
          "statusBarItem.remoteBackground" = "accent";
        };
      };

      "git.autofetch" = true;
      "git.confirmSync" = false;
      "diffEditor.renderSideBySide" = false;
      "git.inputValidation" = "off";
      "gitlens.showWelcomeOnInstall" = false;
      "git.suggestSmartCommit" = false;
      "diffEditor.ignoreTrimWhitespace" = false;

      "editor.fontFamily" = "\"RyanMono Nerd Font\",  monospace";
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

      "terminal.integrated.fontFamily" = "\"RyanTerm Nerd Font\",  monospace";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.lineHeight" = 1.5;
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.defaultProfile.osx" = "fish";
      "terminal.integrated.inheritEnv" = false;
      "terminal.integrated.shellIntegration.enabled" = true;

      "javascript.preferGoToSourceDefinition" = true;
      "typescript.preferGoToSourceDefinition" = true;

      "shellcheck.ignorePatterns" = {
        ".envrc" = true;
      };
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "tailwindCSS.includeLanguages" = {
        "typescript" = "javascript";
        "typescriptreact" = "javascript";
        "vue-html" = "html";
      };
      "typescript.enablePromptUseWorkspaceTsdk" = true;

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

      "gitlens.defaultTimeFormat" = "HH=mm";
      "gitlens.defaultDateShortFormat" = "YYYY/MM/DD";
      "gitlens.defaultDateFormat" = null;

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

      "deno.inlayHints.enumMemberValues.enabled" = false;
      "deno.inlayHints.functionLikeReturnTypes.enabled" = false;
      "deno.inlayHints.parameterNames.enabled" = "none";
      "deno.inlayHints.parameterTypes.enabled" = false;
      "deno.inlayHints.propertyDeclarationTypes.enabled" = false;
      "deno.inlayHints.variableTypes.enabled" = false;

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
