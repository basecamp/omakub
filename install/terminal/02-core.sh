#!/usr/bin/env bash
set -euxo pipefail

# Installs all terminal apps that are meant to be shared between host and
# container. Install from inside the devcontainer, because that has the
# libraries needed to compile.
distrobox-enter omakase-toolbox -- bash <<EOF
    # Install Rust
    if ! command -v rustup >/dev/null; then
        # Install rustup and Rust stable
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
        rustup default stable
        rustup update
        echo "Installed Rust"
    else
        echo "Rust is already installed."
    fi

    # Set up cargo config
    if [ ! -d "$HOME/.cargo/config.toml" ]; then
      mkdir -p ~/.cargo
      cp ~/.local/share/omakase-bluefin/configs/cargo.toml ~/.cargo/config.toml
    fi

    # Set up rustfmt config
    if [ ! -d "$HOME/.config/rustfmt/rustfmt.toml" ]; then
      mkdir -p ~/.config/rustfmt
      cp ~/.local/share/omakase-bluefin/configs/rustfmt.toml ~/.config/rustfmt/rustfmt.toml
    fi

    # Install binstall first
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

    cargo binstall -y --locked \
        atuin \
        b3sum \
        bat \
        bottom \
        bunyan \
        cargo-audit \
        cargo-bloat \
        cargo-deny \
        cargo-edit \
        cargo-leptos \
        cargo-nextest \
        cargo-semver-checks \
        cargo-update \
        cargo-watch \
        choose \
        difftastic \
        dircnt \
        du-dust \
        eva \
        eza \
        fd-find \
        ffsend \
        flamegraph \
        git-absorb \
        git-cliff \
        git-delta \
        git-grab \
        git-stats \
        gping \
        hexyl \
        hyperfine \
        jaq \
        jless \
        just \
        leptosfmt \
        lychee \
        mise \
        numbat-cli \
        oha \
        onefetch \
        openring \
        oxipng \
        pastel \
        pgen \
        poetry-udeps \
        ren-find \
        rep-grep \
        rimage \
        ripgrep \
        samply \
        sd \
        sqlx-cli \
        sshx \
        star-history \
        starship \
        svgcleaner \
        tailspin \
        talk-timer \
        tealdeer \
        titlecase \
        tokei \
        toml-fmt \
        trippy \
        typeracer \
        typst-cli \
        wasm-bindgen-cli \
        watchexec-cli \
        xh \
        xsv \
        zellij \
        zoxide

    cargo install --git https://github.com/lukehsiao/tool.git --locked
    cargo install --git https://github.com/Myriad-Dreamin/tinymist --locked tinymist
    cargo install --git https://github.com/tectonic-typesetting/tectonic.git --locked tectonic

    chsh -s /usr/bin/fish
EOF

echo "Installed all core rust tooling."
