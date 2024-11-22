<h1 align="center">
    🍣<br>
    omakase-bluefin
</h1>
<div align="center">
    <strong>An opinionated Bluefin Setup</strong>
</div>
<br>
<div align="center">
  <a href="https://github.com/lukehsiao/omakase-bluefin/blob/main/LICENSE.md">
    <img src="https://img.shields.io/badge/license-BlueOak--1.0.0-whitesmoke" alt="License">
  </a>
</div>
<br>

Turn a fresh [Project Bluefin](https://projectbluefin.io/) installation into my version of a fully-configured development system by running a single command.
`omakase-bluefin` is an opinionated take on and already opinionated Linux workstation.
Inspired by [Omakub](https://omakub.org/).

```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/lukehsiao/omakase-bluefin/main/entry.sh | sh
```

## Overview

These scripts install a set of useful GUI applications as Flatpaks, as well as a single distrobox dev container with all my favorite core tools.
This dev-toolbox is the default terminal experience, and shared access to `$HOME`, so it feels like you are working directly on the host.
