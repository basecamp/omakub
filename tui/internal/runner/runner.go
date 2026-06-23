// Package runner runs Onyx backend work scripts as a Bubble Tea sub-model,
// streaming their combined stdout/stderr into a scrollable viewport with a
// spinner. In dry-run mode it prints the command instead of executing it.
package runner

import (
	"bufio"
	"io"
	"os"
	"os/exec"
	"strings"

	"github.com/charmbracelet/bubbles/spinner"
	"github.com/charmbracelet/bubbles/viewport"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"

	"github.com/Vicjocaso/onyx-setup/tui/internal/config"
	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// Job describes a backend command to run.
type Job struct {
	// Title is shown above the streamed output.
	Title string
	// Cmd is a bash snippet, e.g. `source "$ONYX_PATH/themes/nord/gnome.sh"`.
	Cmd string
}

// Messages flowing back from the running command.
type streamMsg struct{ line string }
type finishedMsg struct{ err error }

// DoneMsg is emitted (via the runner's consumer) when a job finishes, so the
// parent screen can react. It is surfaced through the runner's Update return.
type DoneMsg struct{ Err error }

// Model is a reusable command-runner view.
type Model struct {
	cfg      config.Config
	job      Job
	spinner  spinner.Model
	viewport viewport.Model
	lines    []string
	events   chan tea.Msg
	running  bool
	done     bool
	err      error
	ready    bool
}

// New returns a runner bound to the given config.
func New(cfg config.Config) Model {
	s := spinner.New()
	s.Spinner = spinner.Globe
	s.Style = lipgloss.NewStyle().Foreground(ui.HotPink)
	return Model{cfg: cfg, spinner: s}
}

// SetSize sizes the output viewport.
func (m *Model) SetSize(width, height int) {
	if !m.ready {
		m.viewport = viewport.New(width, height)
		m.ready = true
	} else {
		m.viewport.Width = width
		m.viewport.Height = height
	}
}

// Done reports whether the current job has finished.
func (m Model) Done() bool { return m.done }

// Err returns the job's exit error, if any.
func (m Model) Err() error { return m.err }

// Start launches the job and returns the commands that drive streaming.
func (m *Model) Start(job Job) tea.Cmd {
	m.job = job
	m.running = true
	m.done = false
	m.err = nil
	m.lines = nil

	if m.cfg.DryRun {
		m.lines = []string{"[dry-run] would run:", "  " + job.Cmd}
		m.running = false
		m.done = true
		m.refresh()
		return nil
	}

	m.events = make(chan tea.Msg, 64)
	go runJob(m.cfg, job, m.events)
	return tea.Batch(m.spinner.Tick, m.waitNext())
}

func (m Model) waitNext() tea.Cmd {
	return func() tea.Msg { return <-m.events }
}

// Update advances streaming and the spinner. It returns the (possibly emitted)
// DoneMsg via the second return so callers can detect completion.
func (m Model) Update(msg tea.Msg) (Model, tea.Cmd) {
	switch msg := msg.(type) {
	case streamMsg:
		m.lines = append(m.lines, msg.line)
		m.refresh()
		return m, m.waitNext()

	case finishedMsg:
		m.running = false
		m.done = true
		m.err = msg.err
		if msg.err != nil {
			m.lines = append(m.lines, "", ui.ItemDesc.Render("error: "+msg.err.Error()))
		}
		m.refresh()
		return m, nil

	case spinner.TickMsg:
		if m.running {
			var cmd tea.Cmd
			m.spinner, cmd = m.spinner.Update(msg)
			return m, cmd
		}
		return m, nil
	}

	var cmd tea.Cmd
	m.viewport, cmd = m.viewport.Update(msg)
	return m, cmd
}

// View renders the runner.
func (m Model) View() string {
	var head string
	if m.running {
		head = m.spinner.View() + " " + ui.Title.Render(m.job.Title)
	} else if m.err != nil {
		head = ui.Title.Render(m.job.Title + " — failed")
	} else {
		head = ui.Title.Render(m.job.Title + " — done")
	}

	body := ui.OutputBox.Render(m.viewport.View())

	var hint string
	if m.done {
		hint = ui.HelpBar.Render("esc/enter • back")
	} else {
		hint = ui.HelpBar.Render("running…")
	}

	return lipgloss.JoinVertical(lipgloss.Left, head, body, hint)
}

func (m *Model) refresh() {
	if !m.ready {
		return
	}
	m.viewport.SetContent(strings.Join(m.lines, "\n"))
	m.viewport.GotoBottom()
}

// runJob executes the command and feeds lines + completion into ch, preserving
// ordering (all output arrives before the finishedMsg).
func runJob(cfg config.Config, job Job, ch chan<- tea.Msg) {
	cmd := exec.Command("bash", "-c", job.Cmd)
	cmd.Env = append(os.Environ(), "ONYX_PATH="+cfg.OnyxPath)

	pr, pw := io.Pipe()
	cmd.Stdout = pw
	cmd.Stderr = pw

	if err := cmd.Start(); err != nil {
		ch <- finishedMsg{err: err}
		return
	}

	scanDone := make(chan struct{})
	go func() {
		sc := bufio.NewScanner(pr)
		sc.Buffer(make([]byte, 0, 64*1024), 1024*1024)
		for sc.Scan() {
			ch <- streamMsg{line: sc.Text()}
		}
		close(scanDone)
	}()

	err := cmd.Wait()
	_ = pw.Close()
	<-scanDone
	ch <- finishedMsg{err: err}
}
