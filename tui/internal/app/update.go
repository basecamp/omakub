package app

import (
	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// newUpdateMenu mirrors bin/onyx-sub/update.sh. Both actions are interactive
// (migrate runs `git pull` + a gum confirm; lazydocker uses apt), so they exec.
func newUpdateMenu() Screen {
	items := []ui.Item{
		{Label: "Onyx", Desc: "Update Onyx itself and run any migrations"},
		{Label: "LazyDocker", Desc: "TUI for Docker"},
		{Label: "<< Back"},
	}
	return newMenu("Update applications", items, true, func(idx int, item ui.Item) tea.Cmd {
		switch item.Label {
		case "Onyx":
			return execute("Update Onyx", `source "$ONYX_PATH/bin/onyx-sub/migrate.sh"`)
		case "LazyDocker":
			return execute("Update LazyDocker", `source "$ONYX_PATH/install/terminal/app-lazydocker.sh"`)
		}
		return pop()
	})
}
