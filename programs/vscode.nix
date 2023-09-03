{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = [];

    userSettings = {
      workbench.colorTheme = "Catppuccin Frappé";
      workbench.iconTheme = "catppuccin-frappe";
      catppuccin.boldKeywords = false;
      catppuccin.italicKeywords = true;
      catppuccin.accentColor = "sky";
      catppuccin.workbenchMode = "default";
      catppuccin.customUIColors = {
        all = {
          activityBar.activeBorder = "accent";
        };
      };

      git.autofetch = true;
      git.confirmSync = false;
      diffEditor.renderSideBySide = false;
      git.inputValidation = "off";
      gitlens.showWelcomeOnInstall = false;
      git.suggestSmartCommit = false;
      diffEditor.ignoreTrimWhitespace = false;

      editor.fontFamily = "\"CaskaydiaCove Nerd Font\", monospace";
      editor.formatOnSave = true;
      editor.fontLigatures = "'calt', 'ss01'";
      editor.insertSpaces = true;
      editor.tabSize = 2;
      editor.cursorSmoothCaretAnimation = "on";
      editor.fontSize = 16;
      editor.lineHeight = 1.5;
      editor.minimap.renderCharacters = false;
      editor.cursorBlinking = "phase";
      editor.inlineSuggest.enabled = true;
      workbench.editor.highlightModifiedTabs = true;
      workbench.editor.untitled.hint = "hidden";

      terminal.integrated.fontFamily = "\"CaskaydiaCove Nerd Font Mono\", monospace";
      terminal.integrated.fontSize = 14;
      terminal.integrated.lineHeight = 1.5;
      terminal.integrated.cursorBlinking = true;
      terminal.integrated.defaultProfile.osx = "fish";
      terminal.integrated.inheritEnv = false;
      terminal.integrated.shellIntegration.enabled = false;

      shellcheck.ignorePatterns = {".envrc" = true;};
      editor.defaultFormatter = "esbenp.prettier-vscode";
      tailwindCSS.includeLanguages = {
        typescript = "javascript";
        typescriptreact = "javascript";
        vue-html = "html";
      };
      typescript.enablePromptUseWorkspaceTsdk = true;

      telemetry.telemetryLevel = "off";
      workbench.enableExperiments = false;
      workbench.settings.enableNaturalLanguageSearch = false;
      extensions.ignoreRecommendations = true;
      editor.accessibilitySupport = "off";

      vscord.status.details.text.editing = "In {{workspace}";
      vscord.status.details.text.viewing = "In {workspace}";
      vscord.status.problems.enabled = false;
      vscord.status.state.text.editing = "Working on {file_name}{file_extension}";
      vscord.status.buttons.button1.enabled = false;

      gitlens.defaultTimeFormat = "HH=mm";
      gitlens.defaultDateShortFormat = "YYYY/MM/DD";
      gitlens.defaultDateFormat = null;

      "[python]" = {
        editor.tabSize = 4;
        editor.defaultFormatter = "ms-python.black-formatter";
      };
      "[cpp]" = {
        editor.defaultFormatter = "ms-vscode.cpptools";
      };
      "[toml]" = {
        editor.defaultFormatter = "tamasfe.even-better-toml";
      };
      "[rust]" = {
        editor.defaultFormatter = "rust-lang.rust-analyzer";
      };
      "[nix]" = {
        editor.defaultFormatter = "jnoortheen.nix-ide";
      };
      "[svelte]" = {
        editor.defaultFormatter = "svelte.svelte-vscode";
      };
      "[go][go.mod][go.sum]" = {
        editor.defaultFormatter = "golang.go";
      };
      "[xml]" = {
        editor.defaultFormatter = "DotJoshJohnson.xml";
      };
      "[fish]" = {
        editor.defaultFormatter = "bmalehorn.vscode-fish";
      };
      "[just]" = {
        editor.defaultFormatter = "skellock.just";
      };
      "[mdx]" = {
        editor.wordWrap = "on";
      };
      "[astro]" = {
        editor.defaultFormatter = "astro-build.astro-vscode";
      };

      rust-analyzer.server.path = "${pkgs.rust-analyzer}/bin/rust-analyzer";

      files.associations = {
        "*.mcmeta" = "json";
        "*.plist" = "xml";
        ".dockerignore" = "ignore";
        ".dev.vars" = "properties";
        ".env.example" = "properties";
        "*.sarif" = "json";
        ".tokeignore" = "ignore";
        "flake.lock" = "json";
      };

      deno.inlayHints.enumMemberValues.enabled = false;
      deno.inlayHints.functionLikeReturnTypes.enabled = false;
      deno.inlayHints.parameterNames.enabled = "none";
      deno.inlayHints.parameterTypes.enabled = false;
      deno.inlayHints.propertyDeclarationTypes.enabled = false;
      deno.inlayHints.variableTypes.enabled = false;

      svelte.enable-ts-plugin = true;

      nix.enableLanguageServer = true;
      nix.serverPath = "${pkgs.nil}/bin/nil";
      nix.serverSettings = {
        nil = {
          formatting = {
            command = ["${pkgs.alejandra}/bin/alejandra"];
          };
        };
      };
    };
  };
}
