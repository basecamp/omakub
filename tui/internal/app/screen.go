package app

import (
	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/runner"
)

// Screen is one view in the navigation stack. Screens are plain Bubble Tea
// models that return a (possibly new) Screen plus a command. Navigation is
// expressed by emitting the messages below, which the root model interprets.
// Render fills the given inner width/height (the root supplies the layout).
type Screen interface {
	Init() tea.Cmd
	Update(msg tea.Msg) (Screen, tea.Cmd)
	Render(width, height int) string
}

// titled is implemented by screens that expose a heading for the breadcrumb.
type titled interface {
	screenTitle() string
}

// panedScreen is implemented by list-style screens that want the two-pane
// layout: a navigation list on the left and a contextual detail panel on the
// right. The root detects this capability and lays the panes out.
type panedScreen interface {
	titled
	// listView renders the selectable list for the sidebar.
	listView() string
	// detail returns the heading + description of the focused item.
	detail() (heading, body string)
}

// Navigation / action messages emitted by screens and handled by the root.
type (
	// pushScreen pushes a new screen onto the stack.
	pushScreen struct{ screen Screen }
	// popScreen returns to the previous screen (no-op on the root screen).
	popScreen struct{}
	// runJobMsg runs a non-interactive backend command in the streamed runner.
	runJobMsg struct{ job runner.Job }
	// execMsg runs an interactive/sudo command with the full terminal handed
	// over (Bubble Tea is suspended, then resumes). Status is shown afterwards.
	execMsg struct {
		title string
		cmd   string
	}
	// quitMsg exits the program.
	quitMsg struct{}
)

// resolvedOnyxPath is the absolute Onyx root, set once at startup so screen
// constructors can build on-disk paths (e.g. for the filepicker).
var resolvedOnyxPath string

func onyxPath() string { return resolvedOnyxPath }

// Command helpers wrap the navigation messages as tea.Cmds.
func push(s Screen) tea.Cmd { return func() tea.Msg { return pushScreen{s} } }
func pop() tea.Cmd          { return func() tea.Msg { return popScreen{} } }
func quit() tea.Cmd         { return func() tea.Msg { return quitMsg{} } }
func run(j runner.Job) tea.Cmd {
	return func() tea.Msg { return runJobMsg{job: j} }
}
func execute(title, cmd string) tea.Cmd {
	return func() tea.Msg { return execMsg{title: title, cmd: cmd} }
}
