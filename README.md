# BTR Omakub

This repo is based on the excellent [omakub.org](https://omakub.org) from 37signals, which turns "a fresh Ubuntu installation into a fully-configured, beautiful, and modern web development system by running a single command. That's the one-line pitch for Omakub. No need to write bespoke configs for every essential tool just to get started or to be up on all the latest command-line tools. Omakub is an opinionated take on what Linux can be at its best."

It has been customized to our needs in the BTR group. We have added applications that we need and reduced the customization a bit to have a more vanilla Gnome 3 experience.

Watch the introduction video for Omakub and read more at [omakub.org](https://omakub.org).

## Installation

```
wget -qO- https://raw.githubusercontent.com/rki-mf1/btr-omakub/main/boot.sh | bash
```

## Installed applications

We install a few applications that are commonly used in our group:

- Zotero
- WebEx
- VSCode
- RStudio
- Element Desktop
- Obsidian
- Miniforge (for conda/mamba)
- GitHub CLI

There are also some optional applications:

- Zoom
- 1Password

Some additional applications are installed that can be helpful. See the `install/` directory to see all of them.

If you think something is missing that you think everyone would find useful, please create an issue.

## License

Omakub is released under the [MIT License](https://opensource.org/licenses/MIT). BTR Omakub has the same license.
