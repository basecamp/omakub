package app

import (
	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/runner"
	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// newMainMenu is the root screen (Theme/Font/Update/Install/Uninstall/Manual/Quit).
func newMainMenu() Screen {
	items := []ui.Item{
		{Label: "Theme", Desc: "Change look and feel"},
		{Label: "Font", Desc: "Set terminal font"},
		{Label: "Update", Desc: "Update apps and system"},
		{Label: "Install", Desc: "Add new applications"},
		{Label: "Uninstall", Desc: "Remove applications"},
		{Label: "Manual", Desc: "Open documentation"},
		{Label: "Quit", Desc: "Exit Onyx"},
	}

	// canBack=false: this is the root; esc is a no-op here.
	return newMenu("", items, false, func(idx int, item ui.Item) tea.Cmd {
		switch item.Label {
		case "Theme":
			return push(newThemeMenu())
		case "Font":
			return push(newFontMenu())
		case "Update":
			return push(newUpdateMenu())
		case "Install":
			return push(newInstallMenu())
		case "Uninstall":
			return push(newFilePick("Uninstall application", "Run uninstaller?", onyxPath()+"/uninstall"))
		case "Manual":
			return run(runner.Job{
				Title: "Opening manual",
				Cmd:   `xdg-open "https://manual.onyx.org" >/dev/null 2>&1; echo "Opened https://manual.onyx.org in your browser."`,
			})
		case "Quit":
			return quit()
		}
		return nil
	})
}
