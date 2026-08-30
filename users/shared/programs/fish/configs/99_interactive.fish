# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

if status is-interactive
    if command -q nrr
        source "$(COMPLETE=fish nrr | psub)"
    end
    if command -q nrx
        source "$(COMPLETE=fish nrx | psub)"
    end

    function __set_cursor_beam --on-event fish_prompt -d "Set cursor shape"
        if not functions -q fish_vi_cursor_handle
            echo -en "\e[5 q"
        end
    end
    function __reset_cursor_beam --on-event fish_preexec -d "Reset cursor shape"
        if not functions -q fish_vi_cursor_handle
            echo -en "\e[0 q"
        end
    end

    if test "$TERM_PROGRAM" = "ghostty" && set -q GHOSTTY_RESOURCES_DIR
        source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end
end
