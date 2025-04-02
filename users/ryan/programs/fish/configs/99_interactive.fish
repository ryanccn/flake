# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

if status is-interactive
    nix-your-shell fish | source

    if command -q nrr
        source "$(COMPLETE=fish nrr | psub)"
        if command -q nrx
            source "$(COMPLETE=fish nrx | psub)"
        end
    end

    if set -q GHOSTTY_RESOURCES_DIR
        source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end
end
