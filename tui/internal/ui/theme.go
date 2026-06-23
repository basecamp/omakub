// Package ui holds the shared Lip Gloss palette, styles, and reusable view
// components (header, help bar) for the Onyx TUI.
package ui

import "github.com/charmbracelet/lipgloss"

// Onyx palette — mirrors the ANSI-256 scheme used by the legacy gum menus so
// the new TUI still feels like Onyx.
//
//	105 purple, 141/177/213 pinks, 245 muted gray.
var (
	Purple     = lipgloss.Color("105")
	Violet     = lipgloss.Color("141")
	Pink       = lipgloss.Color("177")
	HotPink    = lipgloss.Color("213")
	Muted      = lipgloss.Color("245")
	Foreground = lipgloss.Color("255")
)

// Gradient is the ordered palette used for the animated header sweep.
var Gradient = []lipgloss.Color{Purple, Violet, Pink, HotPink, Pink}

// Shared styles.
var (
	// AppStyle pads the whole rendered view.
	AppStyle = lipgloss.NewStyle().Padding(1, 2)

	// HeaderBox frames the logo block (replaces the gum `--border double` box).
	HeaderBox = lipgloss.NewStyle().
			Border(lipgloss.DoubleBorder()).
			BorderForeground(Purple).
			Padding(1, 4).
			Margin(1, 0).
			Align(lipgloss.Center)

	// Subtitle is the italic "artificial-softworks" line.
	Subtitle = lipgloss.NewStyle().Foreground(Muted).Italic(true)

	// VersionTag is the bold "vX.Y.Z" line.
	VersionTag = lipgloss.NewStyle().Foreground(Purple).Bold(true)

	// Title styles a screen heading (e.g. "Choose your theme").
	Title = lipgloss.NewStyle().Foreground(HotPink).Bold(true).MarginBottom(1)

	// SelectedItem highlights the focused list row.
	SelectedItem = lipgloss.NewStyle().Foreground(HotPink).Bold(true)

	// NormalItem is an unfocused list row.
	NormalItem = lipgloss.NewStyle().Foreground(Foreground)

	// ItemDesc is the muted description column next to a row label.
	ItemDesc = lipgloss.NewStyle().Foreground(Muted)

	// Cursor is the "▸ " marker for the focused row.
	Cursor = lipgloss.NewStyle().Foreground(HotPink).Bold(true)

	// HelpBar styles the footer key hints.
	HelpBar = lipgloss.NewStyle().Foreground(Muted).MarginTop(1)

	// OutputBox frames streamed command output.
	OutputBox = lipgloss.NewStyle().
			Border(lipgloss.RoundedBorder()).
			BorderForeground(Violet).
			Padding(0, 1)

	// ConfirmBox frames a yes/no dialog.
	ConfirmBox = lipgloss.NewStyle().
			Border(lipgloss.RoundedBorder()).
			BorderForeground(HotPink).
			Padding(1, 3).
			Align(lipgloss.Center)
)
