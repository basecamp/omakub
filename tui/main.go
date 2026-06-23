// Command onyx-tui is the Onyx control panel: an animated Bubble Tea TUI that
// replaces the legacy gum-based bash menus. It reads ONYX_PATH to locate the
// Onyx install and shells out to the existing backend scripts.
package main

import (
	"fmt"
	"os"

	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/app"
	"github.com/Vicjocaso/onyx-setup/tui/internal/config"
)

// version is overridden at build time via -ldflags "-X main.version=...".
var version = ""

func main() {
	cfg := config.Load()
	if version != "" {
		cfg.Version = version
	}

	p := tea.NewProgram(app.New(cfg), tea.WithAltScreen())
	if _, err := p.Run(); err != nil {
		fmt.Fprintln(os.Stderr, "onyx-tui error:", err)
		os.Exit(1)
	}
}
