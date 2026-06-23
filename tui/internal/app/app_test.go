package app

import (
	"strings"
	"testing"

	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/config"
)

// drain repeatedly executes the command and feeds resulting messages back into
// the model until no command remains, collecting every message seen. It guards
// against infinite loops (e.g. the header ticker) with a step cap and by
// dropping frameMsg-producing tick commands.
func drive(t *testing.T, m tea.Model, msgs ...tea.Msg) tea.Model {
	t.Helper()
	for _, msg := range msgs {
		var cmd tea.Cmd
		m, cmd = m.Update(msg)
		// Execute one level of the returned command synchronously (skip the
		// frame ticker which would block / loop forever).
		if cmd != nil {
			if produced := cmd(); produced != nil {
				if _, isFrame := produced.(frameMsg); !isFrame {
					m, _ = m.Update(produced)
				}
			}
		}
	}
	return m
}

func newTestRoot() Root {
	return New(config.Config{OnyxPath: "/tmp/onyx", Version: "test", DryRun: true})
}

func TestMainMenuRenders(t *testing.T) {
	var m tea.Model = newTestRoot()
	m = drive(t, m, tea.WindowSizeMsg{Width: 100, Height: 40})
	view := m.View()
	// The logo is rendered as block glyphs, not the literal word; assert on
	// the menu entries and version instead.
	for _, want := range []string{"Theme", "Font", "Install", "Uninstall", "Quit", "vtest"} {
		if !strings.Contains(view, want) {
			t.Errorf("main menu view missing %q\n%s", want, view)
		}
	}
}

func TestNavigateIntoThemeAndApplyDryRun(t *testing.T) {
	var m tea.Model = newTestRoot()
	m = drive(t, m, tea.WindowSizeMsg{Width: 100, Height: 40})

	// Enter (select first item = Theme) -> pushes theme menu.
	m = drive(t, m, tea.KeyMsg{Type: tea.KeyEnter})
	if got := m.(Root); len(got.stack) != 2 {
		t.Fatalf("expected theme menu pushed, stack=%d", len(got.stack))
	}
	if view := m.View(); !strings.Contains(view, "Choose your theme") {
		t.Fatalf("theme menu not shown:\n%s", view)
	}

	// Select first theme -> dry-run runner should show the command it would run.
	m = drive(t, m, tea.KeyMsg{Type: tea.KeyEnter})
	root := m.(Root)
	if root.mode != modeRun {
		t.Fatalf("expected modeRun after applying theme, got %v", root.mode)
	}
	view := m.View()
	if !strings.Contains(view, "dry-run") || !strings.Contains(view, "themes/tokyo-night/gnome.sh") {
		t.Fatalf("dry-run output missing expected command:\n%s", view)
	}
}

func TestBackPopsScreen(t *testing.T) {
	var m tea.Model = newTestRoot()
	m = drive(t, m, tea.WindowSizeMsg{Width: 100, Height: 40})
	m = drive(t, m, tea.KeyMsg{Type: tea.KeyEnter}) // into Theme
	m = drive(t, m, tea.KeyMsg{Type: tea.KeyEsc})   // back to main
	if got := m.(Root); len(got.stack) != 1 {
		t.Fatalf("expected back to main menu, stack=%d", len(got.stack))
	}
}

func TestTwoPaneLayout(t *testing.T) {
	var m tea.Model = newTestRoot()
	m = drive(t, m, tea.WindowSizeMsg{Width: 120, Height: 40})
	view := m.View()

	t.Logf("\n%s", view) // visible with `go test -run TwoPane -v`

	// Two bordered panels (rounded-border glyphs) + the details panel + the
	// focused item's description proves the sidebar/detail split rendered.
	for _, want := range []string{"╭", "╮", "│", "Details", "Change look and feel", "Onyx"} {
		if !strings.Contains(view, want) {
			t.Errorf("two-pane view missing %q", want)
		}
	}

	// The composition should roughly fill the 40-row window.
	if got := strings.Count(view, "\n") + 1; got < 30 {
		t.Errorf("view only %d rows tall, expected to fill ~40", got)
	}
}

func TestSlug(t *testing.T) {
	cases := map[string]string{
		"Tokyo Night":  "tokyo-night",
		"Matte Black":  "matte-black",
		"Nord":         "nord",
		"Forest Haven": "forest-haven",
	}
	for in, want := range cases {
		if got := slug(in); got != want {
			t.Errorf("slug(%q) = %q, want %q", in, got, want)
		}
	}
}
