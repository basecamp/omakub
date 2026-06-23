// Package config resolves runtime settings for the Onyx TUI: where the Onyx
// install lives (ONYX_PATH), the current version, and whether we are in
// dry-run mode (ONYX_DRY_RUN) which prints backend commands instead of running
// them.
package config

import (
	"os"
	"path/filepath"
	"strings"
)

// Config holds resolved runtime settings.
type Config struct {
	// OnyxPath is the root of the Onyx install (default ~/.local/share/onyx).
	OnyxPath string
	// Version is the contents of the repo's `version` file, or "dev".
	Version string
	// DryRun, when true, makes the runner echo commands instead of executing.
	DryRun bool
}

// Load resolves configuration from the environment.
func Load() Config {
	path := os.Getenv("ONYX_PATH")
	if path == "" {
		home, err := os.UserHomeDir()
		if err == nil {
			path = filepath.Join(home, ".local", "share", "onyx")
		}
	}

	return Config{
		OnyxPath: path,
		Version:  readVersion(path),
		DryRun:   isTruthy(os.Getenv("ONYX_DRY_RUN")),
	}
}

// readVersion reads the `version` file at the Onyx root. Falls back to "dev".
func readVersion(onyxPath string) string {
	if onyxPath == "" {
		return "dev"
	}
	data, err := os.ReadFile(filepath.Join(onyxPath, "version"))
	if err != nil {
		return "dev"
	}
	v := strings.TrimSpace(string(data))
	if v == "" {
		return "dev"
	}
	return v
}

func isTruthy(s string) bool {
	switch strings.ToLower(strings.TrimSpace(s)) {
	case "1", "true", "yes", "on":
		return true
	default:
		return false
	}
}
