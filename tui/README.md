# Onyx TUI

The Onyx control panel — an animated [Bubble Tea](https://github.com/charmbracelet/bubbletea)
terminal app that powers the `onyx` command. It replaces the legacy `gum`-based bash menus
(`bin/onyx-sub/*.sh`) with a single styled binary, while still shelling out to the existing
backend scripts (theme apply, app installers, etc.).

## Layout

```
tui/
  main.go                       # tea.Program entrypoint
  internal/
    config/                     # ONYX_PATH, version, ONYX_DRY_RUN
    ui/                         # Lip Gloss palette, animated header, list, keys
    runner/                     # streamed exec of non-interactive backend scripts
    app/                        # screen stack: main menu, theme, font, install, …
```

## Architecture

- **Navigation** is a stack of `Screen`s. Screens emit navigation/action messages
  (`push`, `pop`, `run`, `execute`, `quit`) that the root model in `internal/app/root.go`
  interprets.
- **Non-interactive** backend work (theme/font apply) streams through `internal/runner`
  with a spinner + scrollable output.
- **Interactive / sudo** work (app installs, `gum`-based selectors, `migrate.sh`) is run
  via `tea.ExecProcess`, which hands the full terminal to the script and resumes afterward.

## Local development

```bash
cd tui

# Safe: prints the backend command each action *would* run instead of executing it.
ONYX_PATH="$(pwd)/.." ONYX_DRY_RUN=1 go run .

# Real run (will apply themes, install apps, etc.):
ONYX_PATH="$(pwd)/.." go run .

go test ./...
go vet ./...
```

## Release

`.github/workflows/release.yml` builds `onyx-tui_linux_{amd64,arm64}` on `v*` tags and
attaches them to the GitHub Release. The installer
(`install/terminal/required/app-onyx-tui.sh`) downloads the matching binary into
`~/.local/share/onyx/bin/onyx-tui`. The binary is **not** committed.
