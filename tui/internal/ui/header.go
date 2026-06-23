package ui

import (
	"strings"

	"github.com/charmbracelet/lipgloss"
)

// LogoLines is the ONYX wordmark (matches ascii.sh).
var LogoLines = []string{
	`  ██████  ███    ██ ██    ██ ██   ██`,
	` ██    ██ ████   ██  ██  ██   ██ ██ `,
	` ██    ██ ██ ██  ██   ████     ███  `,
	` ██    ██ ██  ██ ██    ██     ██ ██ `,
	`  ██████  ██   ████    ██    ██   ██`,
}

// RenderHeader returns the bordered header block. frame advances the gradient
// sweep across the logo so each animation tick shifts the colors one step.
func RenderHeader(version string, frame int) string {
	var b strings.Builder
	for i, line := range LogoLines {
		c := Gradient[(i+frame)%len(Gradient)]
		b.WriteString(lipgloss.NewStyle().Foreground(c).Render(line))
		if i < len(LogoLines)-1 {
			b.WriteByte('\n')
		}
	}

	content := lipgloss.JoinVertical(
		lipgloss.Center,
		b.String(),
		"",
		Subtitle.Render("artificial-softworks"),
		"",
		VersionTag.Render("v"+version),
	)

	return HeaderBox.Render(content)
}
