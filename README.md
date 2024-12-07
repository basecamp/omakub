<h1 align="center">
    🍣<br>
    omakase-blue
</h1>
<div align="center">
    <strong>An opinionated Atomic Fedora Sway Setup</strong>
</div>
<br>
<div align="center">
  <a href="https://github.com/lukehsiao/omakase-blue/blob/main/LICENSE.md">
    <img src="https://img.shields.io/badge/license-BlueOak--1.0.0-whitesmoke" alt="License">
  </a>
</div>
<br>

Turn a fresh [Wayblue Sway](https://github.com/wayblueorg/wayblue) installation into my version of a fully-configured development system by running a single command.
`omakase-blue` is an opinionated take on an already opinionated Linux workstation.
Inspired by [Omakub](https://omakub.org/).

```
curl --proto '=https' --tlsv1.2 -sSf https://luke.hsiao.dev/omakase-blue.sh | sh
```

## Overview

These scripts install a set of useful GUI applications as Flatpaks, as well as a single distrobox dev container with all my favorite core tools.
This dev-toolbox is the default terminal experience, and shared access to `$HOME`, so it feels like you are working directly on the host.

## Installation

The easiest way to install wayblue sway right now is likely to install [Project Bluefin](https://projectbluefin.io/) the normal way.
Then, follow the [Wayblue Sway instructions](https://github.com/wayblueorg/wayblue?tab=readme-ov-file#rebasing) to rebase your install on wayblue.

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/wayblueorg/$IMAGE_NAME:latest
systemctl reboot
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/wayblueorg/$IMAGE_NAME:latest
systemctl reboot
```

Then, currently due to the known issues, you need to first install two things:

```
ujust install-brew
rpm-ostree install fish
systemctl reboot
```

Then, you can run the script.

## Tailscale

If you want to use tailscale for ssh/mosh, you probable need to

```
sudo systemctl enable --now sshd
sudo firewall-cmd --add-interface=tailscale0 --zone=trusted --permanent
```

on the host.

## Known Issues

- homebrew is missing from the base image
- fish requires a reboot in the middle of the install
- you cannot run `omakaseblue` from within the toolbox (since we do not set up bash)
- uninstall and update paths are not well tested (e.g., we know uninstall does NOT uninstall everything we installed)

## License

This repository is distributed under the terms of the Blue Oak license.
Any contributions are licensed under the same license, and acknowledge via the [Developer Certificate of Origin](https://developercertificate.org/).
[Omakub](https://omakub.org/), which this repository is derived from, is distributed under the [MIT License](https://opensource.org/license/MIT).

See [LICENSE](LICENSE) for details.
