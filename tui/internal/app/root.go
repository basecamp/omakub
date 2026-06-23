// Package app implements the Onyx control-panel TUI: a navigation stack of
// screens rendered under an animated header, with a streamed command runner for
// non-interactive backend scripts and full-terminal hand-off for interactive
// (sudo/gum) ones.
package app

import (
	"os"
	"os/exec"
	"strings"
	"time"

	"github.com/charmbracelet/bubbles/help"
	"github.com/charmbracelet/bubbles/key"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"

	"github.com/Vicjocaso/onyx-setup/tui/internal/config"
	"github.com/Vicjocaso/onyx-setup/tui/internal/runner"
	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

type mode int

const (
	modeMenu mode = iota // navigating screens
	modeRun              // streamed runner is active/showing output
)

// frameMsg advances the header gradient animation.
type frameMsg struct{}

// execDoneMsg is delivered after an interactive (ExecProcess) command returns.
type execDoneMsg struct {
	title string
	err   error
}

func tickFrame() tea.Cmd {
	return tea.Tick(120*time.Millisecond, func(time.Time) tea.Msg { return frameMsg{} })
}

// Root is the top-level Bubble Tea model.
type Root struct {
	cfg    config.Config
	help   help.Model
	runner runner.Model
	stack  []Screen
	mode   mode
	frame  int
	status string
	width  int
	height int
}

// New builds the root model and pushes the main menu.
func New(cfg config.Config) Root {
	resolvedOnyxPath = cfg.OnyxPath
	return Root{
		cfg:    cfg,
		help:   ui.NewHelp(),
		runner: runner.New(cfg),
		stack:  []Screen{newMainMenu()},
		mode:   modeMenu,
	}
}

func (r Root) Init() tea.Cmd {
	return tea.Batch(tickFrame(), r.top().Init())
}

func (r Root) top() Screen { return r.stack[len(r.stack)-1] }

func (r *Root) replaceTop(s Screen) { r.stack[len(r.stack)-1] = s }

func (r Root) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case frameMsg:
		r.frame++
		return r, tickFrame()

	case tea.WindowSizeMsg:
		r.width, r.height = msg.Width, msg.Height
		r.help.Width = msg.Width
		_, midH, _, _ := r.layout()
		r.runner.SetSize(maxInt(r.width-8, 20), maxInt(midH-5, 3))
		// Forward to the current screen too (filepicker sizing).
		s, cmd := r.top().Update(msg)
		r.replaceTop(s)
		return r, cmd

	case pushScreen:
		r.stack = append(r.stack, msg.screen)
		return r, msg.screen.Init()

	case popScreen:
		if len(r.stack) > 1 {
			r.stack = r.stack[:len(r.stack)-1]
		}
		return r, nil

	case quitMsg:
		return r, tea.Quit

	case runJobMsg:
		r.mode = modeRun
		r.status = ""
		cmd := r.runner.Start(msg.job)
		return r, cmd

	case execMsg:
		return r.handleExec(msg)

	case execDoneMsg:
		if msg.err != nil {
			r.status = ui.ItemDesc.Render("✗ " + msg.title + " failed: " + msg.err.Error())
		} else {
			r.status = ui.VersionTag.Render("✓ " + msg.title + " completed")
		}
		return r, nil

	case tea.KeyMsg:
		return r.handleKey(msg)
	}

	// Unhandled messages (spinner ticks, runner stream/finish, filepicker
	// dir reads) are routed to whichever component is active.
	if r.mode == modeRun {
		var cmd tea.Cmd
		r.runner, cmd = r.runner.Update(msg)
		return r, cmd
	}
	s, cmd := r.top().Update(msg)
	r.replaceTop(s)
	return r, cmd
}

func (r Root) handleKey(msg tea.KeyMsg) (tea.Model, tea.Cmd) {
	// Global quit.
	if key.Matches(msg, ui.Keys.Quit) {
		// In run mode, only quit on ctrl+c; let 'q' fall through so it doesn't
		// kill the app mid-stream by accident.
		if r.mode != modeRun || msg.String() == "ctrl+c" {
			return r, tea.Quit
		}
	}

	r.status = ""

	if r.mode == modeRun {
		if r.runner.Done() && (key.Matches(msg, ui.Keys.Back) || key.Matches(msg, ui.Keys.Select)) {
			r.mode = modeMenu
			return r, nil
		}
		var cmd tea.Cmd
		r.runner, cmd = r.runner.Update(msg)
		return r, cmd
	}

	s, cmd := r.top().Update(msg)
	r.replaceTop(s)
	return r, cmd
}

func (r Root) handleExec(msg execMsg) (tea.Model, tea.Cmd) {
	// In dry-run, just echo through the streamed runner (no terminal hand-off).
	if r.cfg.DryRun {
		r.mode = modeRun
		cmd := r.runner.Start(runner.Job{Title: msg.title, Cmd: msg.cmd})
		return r, cmd
	}

	c := exec.Command("bash", "-c", msg.cmd)
	c.Env = append(os.Environ(), "ONYX_PATH="+r.cfg.OnyxPath)
	title := msg.title
	return r, tea.ExecProcess(c, func(err error) tea.Msg {
		return execDoneMsg{title: title, err: err}
	})
}

// layout computes the vertical/horizontal split for the current window size.
func (r Root) layout() (headerH, midH, sideW, detailW int) {
	headerH = lipgloss.Height(ui.RenderHeader(r.cfg.Version, 0))
	midH = r.height - headerH - 3 // 1 gap line + 2-line footer (rule + help)
	if midH < 3 {
		midH = 3
	}
	sideW = 32
	if r.width < 76 {
		sideW = maxInt(r.width/3, 16)
	}
	detailW = r.width - sideW - 1
	if detailW < 12 {
		detailW = 12
	}
	return
}

func (r Root) View() string {
	if r.width == 0 || r.height == 0 {
		return "Loading Onyx…"
	}

	header := lipgloss.PlaceHorizontal(r.width, lipgloss.Center, ui.RenderHeader(r.cfg.Version, r.frame))
	headerH, midH, sideW, detailW := r.layout()
	_ = headerH

	var middle string
	switch {
	case r.mode == modeRun:
		middle = lipgloss.Place(r.width, midH, lipgloss.Center, lipgloss.Top, r.runner.View())

	default:
		if p, ok := r.top().(panedScreen); ok && r.width >= 64 {
			navTitle := p.screenTitle()
			if navTitle == "" {
				navTitle = "Onyx"
			}
			side := ui.Panel(navTitle, p.listView(), sideW, midH, ui.Violet, true)

			head, body := p.detail()
			// Panel reserves 2 cols of border + 2 cols of padding.
			det := ui.Panel("Details", r.detailPanel(head, body, detailW-4), detailW, midH, ui.Purple, false)

			middle = lipgloss.JoinHorizontal(lipgloss.Top, side, " ", det)
		} else {
			middle = lipgloss.Place(r.width, midH, lipgloss.Center, lipgloss.Top, r.top().Render(r.width, midH))
		}
	}

	return lipgloss.JoinVertical(lipgloss.Left, header, "", middle, r.footerView())
}

// footerView renders the bottom rule + help/status bar.
func (r Root) footerView() string {
	rule := lipgloss.NewStyle().Foreground(ui.Muted).Render(strings.Repeat("─", maxInt(r.width, 1)))
	bottom := r.help.View(ui.Keys)
	if r.status != "" {
		bottom = r.status
	}
	return lipgloss.JoinVertical(lipgloss.Left, rule, bottom)
}

// breadcrumb joins the stack's screen titles ("Onyx › Choose your theme").
func (r Root) breadcrumb() string {
	parts := make([]string, 0, len(r.stack))
	for _, s := range r.stack {
		t := "Onyx"
		if ts, ok := s.(titled); ok && ts.screenTitle() != "" {
			t = ts.screenTitle()
		}
		parts = append(parts, t)
	}
	return strings.Join(parts, " › ")
}

// detailPanel builds the right-hand panel body for the focused item.
func (r Root) detailPanel(heading, desc string, w int) string {
	if w < 1 {
		w = 1
	}
	hLabel, hint := heading, "Press enter to select"
	switch heading {
	case "<< Back":
		hLabel, hint, desc = "Back", "Press enter to go back", "Return to the previous menu."
	case "Quit":
		hint = "Press enter to exit Onyx"
	case "> Change size":
		hLabel = "Change size"
	case "> All":
		hLabel = "All installers"
	}

	lines := []string{
		ui.Breadcrumb.Render(ui.Truncate(r.breadcrumb(), w)),
		"",
		ui.DetailHeading.Render(ui.Truncate(hLabel, w)),
	}
	if desc != "" {
		lines = append(lines, "", lipgloss.NewStyle().Width(w).Foreground(ui.Foreground).Render(desc))
	}
	lines = append(lines, "", ui.Hint.Render(hint))
	return lipgloss.JoinVertical(lipgloss.Left, lines...)
}

func maxInt(a, b int) int {
	if a > b {
		return a
	}
	return b
}
