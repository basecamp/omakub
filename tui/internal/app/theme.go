package app

import (
	"os"
	"path/filepath"
	"sort"
	"strings"

	tea "github.com/charmbracelet/bubbletea"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"

	"github.com/Vicjocaso/onyx-setup/tui/internal/runner"
	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// fallbackThemeSlugs is used when the themes directory can't be scanned (e.g.
// ONYX_PATH unset). Mirrors the historical bin/onyx-sub/theme.sh list.
var fallbackThemeSlugs = []string{
	"tokyo-night", "catppuccin", "nord", "everforest", "ristretto",
	"matte-black", "lunar-peaks", "neon-circuit", "forest-haven",
}

// slug converts a display name to its theme directory name (lower-cased,
// spaces -> dashes).
func slug(name string) string {
	return strings.ReplaceAll(strings.ToLower(name), " ", "-")
}

// prettify turns a theme directory slug into a display name ("tokyo-night" ->
// "Tokyo Night").
func prettify(s string) string {
	return cases.Title(language.English).String(strings.ReplaceAll(s, "-", " "))
}

// themeSlugs returns the available theme directory names by scanning
// $ONYX_PATH/themes for subdirectories that contain a gnome.sh. Falls back to
// the historical list if the directory can't be read.
func themeSlugs() []string {
	entries, err := os.ReadDir(filepath.Join(onyxPath(), "themes"))
	if err != nil {
		return fallbackThemeSlugs
	}

	var slugs []string
	for _, e := range entries {
		if !e.IsDir() {
			continue
		}
		if _, err := os.Stat(filepath.Join(onyxPath(), "themes", e.Name(), "gnome.sh")); err != nil {
			continue
		}
		slugs = append(slugs, e.Name())
	}
	if len(slugs) == 0 {
		return fallbackThemeSlugs
	}
	sort.Strings(slugs)
	return slugs
}

// themeApplyCmd reproduces theme.sh: apply gnome, optionally tophat (guarded by
// the same schema check), then vscode. All non-sudo, so it streams in-app.
func themeApplyCmd(themeSlug string) string {
	base := `"$ONYX_PATH/themes/` + themeSlug + `/`
	return strings.Join([]string{
		`source ` + base + `gnome.sh"`,
		`if gsettings list-schemas 2>/dev/null | grep -q "org.gnome.shell.extensions.tophat"; then source ` + base + `tophat.sh"; fi`,
		`if [ -f ` + base + `vscode.sh" ]; then source ` + base + `vscode.sh"; fi`,
	}, "\n")
}

// newThemeMenu builds the theme picker from the themes directory.
func newThemeMenu() Screen {
	slugs := themeSlugs()
	items := make([]ui.Item, 0, len(slugs)+1)
	for _, s := range slugs {
		items = append(items, ui.Item{Label: prettify(s)})
	}
	items = append(items, ui.Item{Label: "<< Back"})

	return newMenu("Choose your theme", items, true, func(idx int, item ui.Item) tea.Cmd {
		if item.Label == "<< Back" {
			return pop()
		}
		return run(runner.Job{
			Title: "Applying " + item.Label,
			Cmd:   themeApplyCmd(slug(item.Label)),
		})
	})
}
