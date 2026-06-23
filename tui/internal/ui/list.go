package ui

import (
	"strings"

	"github.com/charmbracelet/lipgloss"
)

// Item is a single selectable row: a Label and an optional muted Desc column.
type Item struct {
	Label string
	Desc  string
}

// List is a lightweight vertical selector with a styled cursor. It intentionally
// avoids the heavier bubbles/list (filtering/pagination) for a consistent,
// animated Onyx look.
type List struct {
	Items  []Item
	cursor int
}

// NewList returns a list focused on the first item.
func NewList(items []Item) List {
	return List{Items: items}
}

// Up moves the cursor toward the top (wrapping).
func (l *List) Up() {
	if len(l.Items) == 0 {
		return
	}
	l.cursor--
	if l.cursor < 0 {
		l.cursor = len(l.Items) - 1
	}
}

// Down moves the cursor toward the bottom (wrapping).
func (l *List) Down() {
	if len(l.Items) == 0 {
		return
	}
	l.cursor++
	if l.cursor >= len(l.Items) {
		l.cursor = 0
	}
}

// Cursor returns the focused index.
func (l List) Cursor() int { return l.cursor }

// Selected returns the focused item.
func (l List) Selected() Item {
	if len(l.Items) == 0 {
		return Item{}
	}
	return l.Items[l.cursor]
}

// LabelsView renders just the labels with the focused row highlighted (no
// description column). Used for the sidebar in the two-pane layout, where
// descriptions appear in the detail panel instead.
func (l List) LabelsView() string {
	var b strings.Builder
	for i, it := range l.Items {
		marker := "  "
		style := NormalItem
		if i == l.cursor {
			marker = Cursor.Render("▸ ")
			style = SelectedItem
		}
		b.WriteString(marker + style.Render(it.Label))
		if i < len(l.Items)-1 {
			b.WriteByte('\n')
		}
	}
	return b.String()
}

// View renders the list with the focused row highlighted.
func (l List) View() string {
	descCol := 0
	for _, it := range l.Items {
		if it.Desc != "" && lipgloss.Width(it.Label) > descCol {
			descCol = lipgloss.Width(it.Label)
		}
	}

	var b strings.Builder
	for i, it := range l.Items {
		focused := i == l.cursor

		marker := "  "
		labelStyle := NormalItem
		if focused {
			marker = Cursor.Render("▸ ")
			labelStyle = SelectedItem
		}

		row := marker + labelStyle.Render(it.Label)
		if it.Desc != "" {
			pad := descCol - lipgloss.Width(it.Label) + 3
			row += strings.Repeat(" ", pad) + ItemDesc.Render(it.Desc)
		}

		b.WriteString(row)
		if i < len(l.Items)-1 {
			b.WriteByte('\n')
		}
	}
	return b.String()
}
