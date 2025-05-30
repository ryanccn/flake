# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

if status is-interactive
    nix-your-shell fish | source

    if test -d "$(brew --prefix)/share/fish/completions"
        set -p fish_complete_path "$(brew --prefix)/share/fish/completions"
    end
    if test -d "$(brew --prefix)/share/fish/vendor_completions.d"
        set -p fish_complete_path "$(brew --prefix)/share/fish/vendor_completions.d"
    end

    if command -q nrr
        source "$(COMPLETE=fish nrr | psub)"
    end
    if command -q nrx
        source "$(COMPLETE=fish nrx | psub)"
    end

    if test "$TERM_PROGRAM" = "ghostty" && set -q GHOSTTY_RESOURCES_DIR
        source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end
end
