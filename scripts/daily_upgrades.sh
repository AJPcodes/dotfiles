
#!/usr/bin/env bash

set -e

echo "Updating Homebrew..."
brew update

echo "Upgrading formulae..."
brew upgrade

echo "Upgrading casks..."
brew upgrade --cask --greedy

echo "Cleaning up..."
brew cleanup

echo "Updating Mac App Store apps..."
if command -v mas >/dev/null; then
    mas upgrade
fi

# -------------------------
# ASDF SECTION
# -------------------------

if command -v asdf >/dev/null; then
    echo "🔄 Updating asdf core..."
    brew upgrade asdf || true

    echo "🔌 Updating asdf plugins..."
    asdf plugin update --all

    echo "⬇️ Installing latest versions from .tool-versions..."
    asdf install

    echo "🔁 Reshimming runtimes..."
    asdf reshim

    # Optional: install latest available for each plugin
    # echo "⬆️ Checking for newer runtime versions..."
    # for plugin in $(asdf plugin list); do
    #     latest=$(asdf latest "$plugin" 2>/dev/null || true)
    #     if [ -n "$latest" ]; then
    #         echo "  → $plugin: installing $latest"
    #         asdf install "$plugin" "$latest" || true
    #     fi
    # done
fi

echo "Updating npm global packages..."
if command -v npm >/dev/null; then
    npm update -g || true
fi


echo "✅ All updates complete!"
