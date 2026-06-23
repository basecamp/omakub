package app

import (
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"

	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// confirm is a yes/no dialog. It defaults to "No" for safety. On yes it pops
// itself and runs onYes.
type confirm struct {
	question string
	yes      bool
	onYes    tea.Cmd
}

func newConfirm(question string, onYes tea.Cmd) *confirm {
	return &confirm{question: question, onYes: onYes}
}

func (c *confirm) Init() tea.Cmd { return nil }

func (c *confirm) Update(msg tea.Msg) (Screen, tea.Cmd) {
	if msg, ok := msg.(tea.KeyMsg); ok {
		switch msg.String() {
		case "left", "right", "h", "l", "tab":
			c.yes = !c.yes
		case "y", "Y":
			return c, tea.Batch(pop(), c.onYes)
		case "n", "N", "esc":
			return c, pop()
		case "enter":
			if c.yes {
				return c, tea.Batch(pop(), c.onYes)
			}
			return c, pop()
		}
	}
	return c, nil
}

func (c *confirm) screenTitle() string { return "Confirm" }

func (c *confirm) Render(width, height int) string {
	yesStyle, noStyle := ui.NormalItem, ui.NormalItem
	if c.yes {
		yesStyle = ui.SelectedItem
	} else {
		noStyle = ui.SelectedItem
	}
	buttons := lipgloss.JoinHorizontal(
		lipgloss.Center,
		yesStyle.Render("  Yes  "),
		"   ",
		noStyle.Render("  No  "),
	)
	body := lipgloss.JoinVertical(lipgloss.Center, c.question, "", buttons)
	box := ui.ConfirmBox.Render(body)
	return lipgloss.Place(width, height, lipgloss.Center, lipgloss.Center, box)
}
