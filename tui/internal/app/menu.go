package app

import (
	"github.com/charmbracelet/bubbles/key"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"

	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// menu is a generic list-driven screen. onSelect maps the focused item to a
// command (typically a navigation/action helper). If canBack is true, esc pops.
type menu struct {
	title    string
	list     ui.List
	onSelect func(idx int, item ui.Item) tea.Cmd
	canBack  bool
}

// newMenu builds a menu screen.
func newMenu(title string, items []ui.Item, canBack bool, onSelect func(idx int, item ui.Item) tea.Cmd) *menu {
	return &menu{
		title:    title,
		list:     ui.NewList(items),
		onSelect: onSelect,
		canBack:  canBack,
	}
}

func (m *menu) Init() tea.Cmd { return nil }

func (m *menu) Update(msg tea.Msg) (Screen, tea.Cmd) {
	if msg, ok := msg.(tea.KeyMsg); ok {
		switch {
		case key.Matches(msg, ui.Keys.Up):
			m.list.Up()
		case key.Matches(msg, ui.Keys.Down):
			m.list.Down()
		case key.Matches(msg, ui.Keys.Select):
			return m, m.onSelect(m.list.Cursor(), m.list.Selected())
		case key.Matches(msg, ui.Keys.Back):
			if m.canBack {
				return m, pop()
			}
		}
	}
	return m, nil
}

// Render is the fallback single-pane view (narrow terminals). The two-pane
// layout uses listView/detail instead.
func (m *menu) Render(width, height int) string {
	parts := []string{}
	if m.title != "" {
		parts = append(parts, ui.Title.Render(m.title))
	}
	parts = append(parts, m.list.View())
	return lipgloss.JoinVertical(lipgloss.Left, parts...)
}

// screenTitle implements titled.
func (m *menu) screenTitle() string { return m.title }

// listView implements panedScreen (sidebar shows labels only; descriptions go
// in the detail panel).
func (m *menu) listView() string { return m.list.LabelsView() }

// detail implements panedScreen: heading + description of the focused item.
func (m *menu) detail() (string, string) {
	it := m.list.Selected()
	return it.Label, it.Desc
}
