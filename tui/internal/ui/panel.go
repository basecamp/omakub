package ui

import (
	"github.com/charmbracelet/lipgloss"
)

// Panel styling.
var (
	PanelTitle    = lipgloss.NewStyle().Foreground(HotPink).Bold(true)
	DetailHeading = lipgloss.NewStyle().Foreground(Violet).Bold(true)
	Breadcrumb    = lipgloss.NewStyle().Foreground(Muted)
	Hint          = lipgloss.NewStyle().Foreground(Muted).Italic(true)
)

// Panel renders a rounded box of exact total width w and height h with an
// optional title line and a body. The border is accent-colored when focused,
// muted otherwise. Body content is clipped to fit.
func Panel(title, body string, w, h int, accent lipgloss.Color, focused bool) string {
	if w < 4 {
		w = 4
	}
	if h < 3 {
		h = 3
	}
	const padX = 1
	innerH := h - 2            // minus top/bottom border
	contentW := w - 2 - 2*padX // minus border and horizontal padding
	if contentW < 1 {
		contentW = 1
	}

	var header string
	bodyH := innerH
	if title != "" {
		header = PanelTitle.Render(Truncate(title, contentW))
		bodyH = innerH - 1
	}
	if bodyH < 0 {
		bodyH = 0
	}

	bodyBox := lipgloss.NewStyle().
		Width(contentW).
		Height(bodyH).
		MaxHeight(bodyH).
		Render(body)

	inner := bodyBox
	if header != "" {
		inner = lipgloss.JoinVertical(lipgloss.Left, header, bodyBox)
	}

	bc := Muted
	if focused {
		bc = accent
	}
	return lipgloss.NewStyle().
		Border(lipgloss.RoundedBorder()).
		BorderForeground(bc).
		Padding(0, padX).
		Width(contentW).
		Height(innerH).
		Render(inner)
}

// Truncate shortens a plain (non-styled) string to max display columns, adding
// an ellipsis when clipped.
func Truncate(s string, max int) string {
	if max <= 0 {
		return ""
	}
	if lipgloss.Width(s) <= max {
		return s
	}
	r := []rune(s)
	if max <= 1 {
		return string(r[:max])
	}
	return string(r[:max-1]) + "…"
}
