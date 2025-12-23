#!/bin/bash

# Remove orphaned open-alacritty.py Nautilus extension
# This extension was introduced in PR #435 and removed in PR #559,
# but the installed file was never cleaned up for existing users.
# The extension had a bug causing Nautilus context menu to freeze
# due to blocking os.system() call.

if [ -f ~/.local/share/nautilus-python/extensions/open-alacritty.py ]; then
    rm -f ~/.local/share/nautilus-python/extensions/open-alacritty.py
    rm -rf ~/.local/share/nautilus-python/extensions/__pycache__

    # Restart Nautilus to apply changes (if running)
    nautilus -q 2>/dev/null || true
fi
