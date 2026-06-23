package app

import (
	"github.com/charmbracelet/bubbles/filepicker"
	"github.com/charmbracelet/bubbles/key"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"

	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// filePick browses a directory and, on selecting a .sh file, asks to confirm
// before running it. Used for the "Run any installer" and "Uninstall" flows
// (replacing `gum file` + `gum confirm`).
type filePick struct {
	title  string
	verb   string // e.g. "Run installer?"
	fp     filepicker.Model
	height int
}

func newFilePick(title, verb, rootDir string) *filePick {
	fp := filepicker.New()
	fp.CurrentDirectory = rootDir
	fp.AllowedTypes = []string{".sh"}
	fp.ShowHidden = false
	fp.Styles.Cursor = lipgloss.NewStyle().Foreground(ui.HotPink)
	fp.Styles.Selected = lipgloss.NewStyle().Foreground(ui.HotPink).Bold(true)
	fp.Styles.Directory = lipgloss.NewStyle().Foreground(ui.Violet)
	return &filePick{title: title, verb: verb, fp: fp, height: 15}
}

func (f *filePick) Init() tea.Cmd { return f.fp.Init() }

func (f *filePick) Update(msg tea.Msg) (Screen, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.WindowSizeMsg:
		f.height = msg.Height - 16
		if f.height < 5 {
			f.height = 5
		}
		f.fp.Height = f.height
	case tea.KeyMsg:
		// esc returns to the menu. Up-a-level within the tree stays on the
		// filepicker's own keys (h/left/backspace).
		if key.Matches(msg, ui.Keys.Back) {
			return f, pop()
		}
	}

	var cmd tea.Cmd
	f.fp, cmd = f.fp.Update(msg)

	if ok, path := f.fp.DidSelectFile(msg); ok {
		return f, push(newConfirm(
			f.verb,
			execute(f.title, `source "`+path+`"`),
		))
	}
	return f, cmd
}

func (f *filePick) screenTitle() string { return f.title }

func (f *filePick) Render(width, height int) string {
	if height > 0 {
		f.fp.Height = maxInt(height-4, 5)
	}
	body := lipgloss.JoinVertical(
		lipgloss.Left,
		ui.Title.Render(f.title),
		f.fp.View(),
		ui.HelpBar.Render("↑/↓ move • enter open/select • esc back"),
	)
	return body
}
