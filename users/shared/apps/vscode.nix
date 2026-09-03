# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
  lib,
  config,
  ...
}:
let
  flavorName =
    {
      "latte" = "Latte";
      "frappe" = "Frappé";
      "macchiato" = "Macchiato";
      "mocha" = "Mocha";
    }
    .${config.catppuccin.flavor};

  extensions = [
    "astro-build.astro-vscode"
    "bierner.lit-html"
    "bradlc.vscode-tailwindcss"
    "catppuccin.catppuccin-vsc"
    "catppuccin.catppuccin-vsc-icons"
    "charliermarsh.ruff"
    "dbaeumer.vscode-eslint"
    "dprint.dprint"
    "editorconfig.editorconfig"
    "esbenp.prettier-vscode"
    "github.vscode-github-actions"
    "golang.go"
    "jnoortheen.nix-ide"
    "mkhl.direnv"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "naumovs.color-highlight"
    "ronnidc.nunjucks"
    "rust-lang.rust-analyzer"
    "skellock.just"
    "svelte.svelte-vscode"
    "tamasfe.even-better-toml"
    "timonwong.shellcheck"
    "usernamehw.errorlens"
    "vue.volar"
    "yoavbls.pretty-ts-errors"
    "ziglang.vscode-zig"
  ];

  defaultFormatters = {
    "[python]" = "charliermarsh.ruff";
    "[toml]" = "tamasfe.even-better-toml";
    "[svelte]" = "svelte.svelte-vscode";
    "[go][go.mod][go.sum]" = "golang.go";
    "[just]" = "skellock.just";
    "[astro]" = "astro-build.astro-vscode";
    "[rust]" = "rust-lang.rust-analyzer";
    "[nix]" = "jnoortheen.nix-ide";
  };
in
{
  programs.vscode = {
    enable = true;
    package = null;

    profiles.default.userSettings = builtins.foldl' lib.recursiveUpdate { } [
      {
        "workbench.colorTheme" = "Catppuccin ${flavorName}";
        "workbench.iconTheme" = "catppuccin-${config.catppuccin.flavor}";
        "workbench.sideBar.location" = "left";
        "workbench.activityBar.compact" = true;
        "workbench.commandPalette.history" = 0;
        "workbench.experimental.modernUI" = true;

        "editor.semanticHighlighting.enabled" = true;
        "terminal.integrated.minimumContrastRatio" = 1;
        "terminal.integrated.drawBoldTextInBrightColors" = false;
        "window.titleBarStyle" = "custom";

        "catppuccin.accentColor" = config.catppuccin.accent;
        "catppuccin.workbenchMode" = "flat";
        "catppuccin.customUIColors" = {
          "all" = {
            "statusBarItem.remoteBackground" = "accent";
            "activityBar.activeBorder" = "accent";
            "activityBarTop.activeBorder" = "accent";
          };
        };

        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.inputValidation" = false;
        "git.suggestSmartCommit" = false;
        "git.branchRandomName.enable" = true;
        "git.blame.editorDecoration.enabled" = true;
        "git.useIntegratedAskPass" = false;

        "diffEditor.renderSideBySide" = false;
        "diffEditor.ignoreTrimWhitespace" = false;

        "editor.fontFamily" = ''"Ryan Mono", "Symbols Nerd Font", monospace'';
        "editor.fontLigatures" = true;
        "editor.fontSize" = 16;
        "editor.lineHeight" = 1.5;
        "editor.minimap.enabled" = false;
        "workbench.editor.highlightModifiedTabs" = true;
        "workbench.editor.empty.hint" = "hidden";

        "chat.disableAIFeatures" = true;
        "workbench.settings.showAISearchToggle" = false;

        "editor.inlineSuggest.enabled" = true;
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.formatOnSave" = true;

        "terminal.integrated.fontFamily" = ''"Ryan Term", "Symbols Nerd Font Mono", monospace'';
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.lineHeight" = 1.5;
        "terminal.integrated.cursorBlinking" = true;
        "terminal.integrated.inheritEnv" = false;
        "terminal.integrated.initialHint" = false;
        "terminal.integrated.enablePersistentSessions" = false;
        "terminal.integrated.shellIntegration.enabled" = false;
        "terminal.integrated.defaultProfile.osx" = "fish";
        "terminal.integrated.profiles.osx" = {
          "fish" = {
            "path" = "/run/current-system/sw/bin/fish";
            "args" = [ "-l" ];
          };
        };

        "editor.defaultFormatter" = "esbenp.prettier-vscode";

        "javascript.preferGoToSourceDefinition" = true;
        "typescript.preferGoToSourceDefinition" = true;
        "typescript.enablePromptUseWorkspaceTsdk" = true;

        "shellcheck.ignorePatterns".".envrc" = true;
        "tailwindCSS.includeLanguages" = {
          "typescript" = "javascript";
          "typescriptreact" = "javascript";
          "vue-html" = "html";
        };

        "telemetry.telemetryLevel" = "off";
        "telemetry.feedback.enabled" = false;
        "workbench.enableExperiments" = false;
        "workbench.settings.enableNaturalLanguageSearch" = false;
        "extensions.ignoreRecommendations" = true;
        "editor.accessibilitySupport" = "off";

        "[python]"."editor.tabSize" = 4;
        "[rust]"."editor.tabSize" = 4;

        "[mdx]"."editor.wordWrap" = "on";

        "rust-analyzer.server.path" = "rust-analyzer";
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

        "color-highlight.matchRgbWithNoFunction" = true;
        "color-highlight.matchHslWithNoFunction" = true;
        "color-highlight.markRuler" = false;
        "color-highlight.markerType" = "underline";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = lib.getExe pkgs.nil;
        "nix.serverSettings" = {
          "nil" = {
            formatting.command = [ (lib.getExe pkgs.nixfmt) ];
            nix.flake.autoArchive = false;
          };
        };
      }

      (lib.concatMapAttrs (lang: formatter: {
        ${lang}."editor.defaultFormatter" = formatter;
      }) defaultFormatters)
    ];
  };

  home.activation = {
    vscodeExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      code_bin="/usr/local/bin/code"

      if ! command -v "$code_bin" &> /dev/null; then
        echo "code CLI is not available"
        exit 0
      fi

      declare -A currentExtensions
      for extension in $("$code_bin" --list-extensions); do
        currentExtensions["$extension"]=1;
      done

      ${builtins.concatStringsSep "\n" (
        builtins.map (ext: ''
          if [[ -z "''${currentExtensions[${ext}]+unset}" ]]; then
            echo "installing ${ext}"
            $DRY_RUN_CMD "$code_bin" --install-extension ${ext} &> /dev/null
          fi
          unset 'currentExtensions[${ext}]'
        '') extensions
      )}

      for ext in "''${!currentExtensions[@]}"; do
        echo "uninstalling $ext"
        $DRY_RUN_CMD "$code_bin" --uninstall-extension $ext &> /dev/null
        unset 'currentExtensions[$ext]'
      done
    '';
  };
}
