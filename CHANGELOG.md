# Changelog

All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

---
## [0.2.2](https://github.com/lukehsiao/omakase-blue/compare/v0.2.1..v0.2.2) - 2024-12-02

### Bug Fixes

- **(install/desktop)** don't use ibus in sway - ([d8c8839](https://github.com/lukehsiao/omakase-blue/commit/d8c883988df08456c4af3351d767e13e1245573b)) - Luke Hsiao
- **(install/terminal)** fix zellij theme path - ([282f3d2](https://github.com/lukehsiao/omakase-blue/commit/282f3d26069050d2e4ee246992d9a62860510b87)) - Luke Hsiao
- **(install/terminal)** eliminate user prompt on rm - ([81653b3](https://github.com/lukehsiao/omakase-blue/commit/81653b34b5e876aa8d38be0247572655f4f33b63)) - Luke Hsiao
- remove unused gnome settings - ([858b3b1](https://github.com/lukehsiao/omakase-blue/commit/858b3b129d82649fe32a1fd368eed042e7c1d5df)) - Luke Hsiao

### Documentation

- **(README)** add general install instructions - ([33f8f1c](https://github.com/lukehsiao/omakase-blue/commit/33f8f1c6031bbc88a9ff87b69039b5dd30f63496)) - Luke Hsiao

---
## [0.2.1](https://github.com/lukehsiao/omakase-blue/compare/v0.2.0..v0.2.1) - 2024-12-02

### Bug Fixes

- **(install)** detect sway correctly - ([24345ad](https://github.com/lukehsiao/omakase-blue/commit/24345adedc3bd906641f0fdd142832ebc95d45c3)) - Luke Hsiao
- another bad bluefin reference - ([64d6d0c](https://github.com/lukehsiao/omakase-blue/commit/64d6d0cb3e697120f7850c1829911090089f83ac)) - Luke Hsiao

---
## [0.2.0](https://github.com/lukehsiao/omakase-blue/compare/v0.1.1..v0.2.0) - 2024-12-02

This is a HUGE switch from being based on Project Bluefin, to instead being based on wayblue sway.

### Features

- **(fish)** add shell completions - ([012b71b](https://github.com/lukehsiao/omakase-blue/commit/012b71bad04f7dd0722cb76b9a9fa60ab34ae17a)) - Luke Hsiao
- add setup for sway - ([424a980](https://github.com/lukehsiao/omakase-blue/commit/424a980b460a0b8c8ae16dadd1ba4d3432e16c0a)) - Luke Hsiao
- add tailscale layering - ([b5711e6](https://github.com/lukehsiao/omakase-blue/commit/b5711e6bbeac83b022df9d9708c33828ef914bdb)) - Luke Hsiao

### Bug Fixes

- **(configs/sway)** use correct xkb_options syntax - ([b7d12cc](https://github.com/lukehsiao/omakase-blue/commit/b7d12cca75d9c5b1a3252b4053645f64ab2f480e)) - Luke Hsiao
- **(fish)** install fish via layering on the host - ([e81049b](https://github.com/lukehsiao/omakase-blue/commit/e81049bf7ddd5314f72b7e909e4ddc3c98e9949a)) - Luke Hsiao
- **(install)** wayblue sway is fedora - ([d5b0256](https://github.com/lukehsiao/omakase-blue/commit/d5b0256de44306153aebe4bf6b4d3a686d81dbba)) - Luke Hsiao
- **(install)** fix inhibit call and ignore toolboxes - ([9bdbaf6](https://github.com/lukehsiao/omakase-blue/commit/9bdbaf679fdb1411fb4042a06a0aa7deb65c21f8)) - Luke Hsiao
- catch final references to old name - ([80295f6](https://github.com/lukehsiao/omakase-blue/commit/80295f61adf291b457f015037880be1e92bc9008)) - Luke Hsiao

### Documentation

- **(README)** update readme to point at wayblue - ([7316423](https://github.com/lukehsiao/omakase-blue/commit/7316423d24ee1d0d6de9176a20938cb2014e3755)) - Luke Hsiao

### Build and Dependencies

- **(Justfile)** add semver release helpers - ([3c9204b](https://github.com/lukehsiao/omakase-blue/commit/3c9204b6576d0e09a63eaf769f0dec16d667957e)) - Luke Hsiao
- exclude `v` from version file - ([06216cb](https://github.com/lukehsiao/omakase-blue/commit/06216cb3df1c75d966e56d7e32697eb3a921591a)) - Luke Hsiao

---
## [0.1.1](https://github.com/lukehsiao/omakase-blue/compare/v0.1.0..v0.1.1) - 2024-11-24

### Features

- **(install/desktop)** add inkscape - ([9567612](https://github.com/lukehsiao/omakase-blue/commit/95676129bdb31fd60f1c034cf6dc7433aa15cfd4)) - Luke Hsiao
- **(install/desktop)** add drawio as optional - ([c939b9f](https://github.com/lukehsiao/omakase-blue/commit/c939b9ff64f29a66f5a138fb42907f4b698fdc52)) - Luke Hsiao
- **(install/terminal)** add d2lang - ([f04c60a](https://github.com/lukehsiao/omakase-blue/commit/f04c60a06d1c1cf5a184feb0ca08a3e3cc2cc00f)) - Luke Hsiao

---
## 0.1.0 - 2024-11-23

Initial release with the core tools and workflow.
