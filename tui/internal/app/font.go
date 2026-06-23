package app

import (
	"fmt"
	"strconv"

	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/runner"
	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// fontChoice mirrors the options in bin/onyx-sub/font.sh.
type fontChoice struct {
	label    string
	fontName string
	url      string
	fileType string
}

var fontChoices = []fontChoice{
	{"Cascadia Mono", "CaskaydiaMono Nerd Font", "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip", "ttf"},
	{"Fira Mono", "FiraMono Nerd Font", "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip", "otf"},
	{"JetBrains Mono", "JetBrainsMono Nerd Font", "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip", "ttf"},
	{"Meslo", "MesloLGS Nerd Font", "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip", "ttf"},
}

// newFontMenu builds the font picker. Selecting a font runs the extracted
// set-font.sh helper; "Change size" opens the size submenu.
func newFontMenu() Screen {
	items := make([]ui.Item, 0, len(fontChoices)+2)
	for _, f := range fontChoices {
		items = append(items, ui.Item{Label: f.label})
	}
	items = append(items, ui.Item{Label: "> Change size"}, ui.Item{Label: "<< Back"})

	return newMenu("Choose your programming font", items, true, func(idx int, item ui.Item) tea.Cmd {
		switch item.Label {
		case "<< Back":
			return pop()
		case "> Change size":
			return push(newFontSizeMenu())
		default:
			f := fontChoices[idx]
			cmd := fmt.Sprintf(`bash "$ONYX_PATH/bin/onyx-sub/set-font.sh" %q %q %q`, f.fontName, f.url, f.fileType)
			return run(runner.Job{Title: "Setting font: " + f.label, Cmd: cmd})
		}
	})
}

// newFontSizeMenu lists sizes 7..14.
func newFontSizeMenu() Screen {
	items := make([]ui.Item, 0, 9)
	for n := 7; n <= 14; n++ {
		items = append(items, ui.Item{Label: strconv.Itoa(n)})
	}
	items = append(items, ui.Item{Label: "<< Back"})

	return newMenu("Choose your terminal font size", items, true, func(idx int, item ui.Item) tea.Cmd {
		if item.Label == "<< Back" {
			return pop()
		}
		cmd := fmt.Sprintf(`bash "$ONYX_PATH/bin/onyx-sub/set-font-size.sh" %s`, item.Label)
		return run(runner.Job{Title: "Setting font size: " + item.Label, Cmd: cmd})
	})
}
