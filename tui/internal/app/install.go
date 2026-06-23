package app

import (
	tea "github.com/charmbracelet/bubbletea"

	"github.com/Vicjocaso/onyx-setup/tui/internal/ui"
)

// optionalApp builds an exec command sourcing an optional desktop app installer.
func optionalApp(label, slug string) tea.Cmd {
	return execute("Install "+label, `source "$ONYX_PATH/install/desktop/optional/app-`+slug+`.sh"`)
}

// newInstallMenu mirrors bin/onyx-sub/install.sh. Installers run via exec (they
// need sudo / a real TTY); selectors that are still gum-based are also exec'd.
func newInstallMenu() Screen {
	items := []ui.Item{
		{Label: "Browser", Desc: "Install an alternative web browser"},
		{Label: "Dev Database", Desc: "Install development database in Docker"},
		{Label: "Dev Editor", Desc: "Install alternative programming editors"},
		{Label: "Dev Language", Desc: "Install programming language environment"},
		{Label: "Web Apps", Desc: "Install web apps with their own icon and shell"},
		{Label: "Antigravity", Desc: "AI-powered IDE by Google with Gemini 3 Pro"},
		{Label: "ASDControl", Desc: "Set brightness on Apple Studio and XDR displays"},
		{Label: "Bitwarden", Desc: "Open-source password manager"},
		{Label: "Bruno", Desc: "Open-source API client"},
		{Label: "Discord", Desc: "Voice, video, and text chat"},
		{Label: "Geekbench", Desc: "CPU benchmarking tool"},
		{Label: "OpenRGB", Desc: "Control RGB lighting on your hardware"},
		{Label: "Postman", Desc: "API development and testing platform"},
		{Label: "Spotify", Desc: "Stream music"},
		{Label: "Steam", Desc: "Play games from Valve's store"},
		{Label: "TablePlus", Desc: "Modern database management tool"},
		{Label: "Warp", Desc: "Modern AI-powered terminal"},
		{Label: "> All", Desc: "Re-run any of the default installers"},
		{Label: "<< Back"},
	}

	return newMenu("Install application", items, true, func(idx int, item ui.Item) tea.Cmd {
		switch item.Label {
		case "<< Back":
			return pop()
		case "Browser":
			return push(newBrowserMenu())
		case "Dev Editor":
			return push(newEditorMenu())
		case "Dev Database":
			return execute("Dev Database", `source "$ONYX_PATH/install/terminal/select-dev-storage.sh"`)
		case "Dev Language":
			return execute("Dev Language", `source "$ONYX_PATH/install/terminal/select-dev-language.sh"`)
		case "Web Apps":
			return execute("Web Apps", `source "$ONYX_PATH/install/desktop/optional/select-web-apps.sh"`)
		case "Geekbench":
			return execute("Install Geekbench", `source "$ONYX_PATH/install/terminal/optional/app-geekbench.sh"`)
		case "> All":
			return push(newFilePick("Run any installer", "Run installer?", onyxPath()+"/install"))
		case "Antigravity":
			return optionalApp("Antigravity", "antigravity")
		case "ASDControl":
			return optionalApp("ASDControl", "asdcontrol")
		case "Bitwarden":
			return optionalApp("Bitwarden", "bitwarden")
		case "Bruno":
			return optionalApp("Bruno", "bruno")
		case "Discord":
			return optionalApp("Discord", "discord")
		case "OpenRGB":
			return optionalApp("OpenRGB", "openrgb")
		case "Postman":
			return optionalApp("Postman", "postman")
		case "Spotify":
			return optionalApp("Spotify", "spotify")
		case "Steam":
			return optionalApp("Steam", "steam")
		case "TablePlus":
			return optionalApp("TablePlus", "tableplus")
		case "Warp":
			return optionalApp("Warp", "warp")
		}
		return nil
	})
}

func newBrowserMenu() Screen {
	items := []ui.Item{
		{Label: "Zen Browser", Desc: "Privacy-focused browser built on Firefox"},
		{Label: "<< Back"},
	}
	return newMenu("Install browser", items, true, func(idx int, item ui.Item) tea.Cmd {
		if item.Label == "<< Back" {
			return pop()
		}
		return optionalApp("Zen Browser", "zen-browser")
	})
}

func newEditorMenu() Screen {
	items := []ui.Item{
		{Label: "Cursor", Desc: "AI code editor"},
		{Label: "Zed", Desc: "Fast all-purpose editor"},
		{Label: "<< Back"},
	}
	return newMenu("Install editor", items, true, func(idx int, item ui.Item) tea.Cmd {
		switch item.Label {
		case "Cursor":
			return optionalApp("Cursor", "cursor")
		case "Zed":
			return optionalApp("Zed", "zed")
		}
		return pop()
	})
}
