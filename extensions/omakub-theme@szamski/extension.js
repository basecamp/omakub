import Gio from 'gi://Gio';
import GLib from 'gi://GLib';
import GObject from 'gi://GObject';

import {Extension} from 'resource:///org/gnome/shell/extensions/extension.js';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as PopupMenu from 'resource:///org/gnome/shell/ui/popupMenu.js';
import * as QuickSettings from 'resource:///org/gnome/shell/ui/quickSettings.js';

function getBasePath() {
  const envPath = GLib.getenv('OMAKUB_PATH');
  if (envPath && envPath.length > 0)
    return envPath;
  return `${GLib.get_home_dir()}/.local/share/omakub`;
}

function titleCase(input) {
  return input
    .split('-')
    .map(part => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ');
}

function listThemes(basePath) {
  const themeDir = `${basePath}/themes`;
  const themes = [];

  if (!GLib.file_test(themeDir, GLib.FileTest.IS_DIR))
    return themes;

  const dir = Gio.File.new_for_path(themeDir);
  const enumerator = dir.enumerate_children('standard::name,standard::type', Gio.FileQueryInfoFlags.NONE, null);
  let info;
  while ((info = enumerator.next_file(null)) !== null) {
    if (info.get_file_type() !== Gio.FileType.DIRECTORY)
      continue;
    const name = info.get_name();
    const gnomePath = `${themeDir}/${name}/gnome.sh`;
    if (GLib.file_test(gnomePath, GLib.FileTest.EXISTS))
      themes.push(name);
  }

  themes.sort();
  return themes;
}

function applyTheme(basePath, theme) {
  const applyPath = `${basePath}/themes/apply-theme.sh`;
  if (!GLib.file_test(applyPath, GLib.FileTest.EXISTS))
    return;

  const argv = ['bash', '-lc', `source "${applyPath}" "${theme}"`];
  const launcher = new Gio.SubprocessLauncher({ flags: Gio.SubprocessFlags.NONE });
  launcher.setenv('OMAKUB_SZAMSKI_PATH', basePath, true);
  launcher.spawnv(argv);
}

const ThemeIndicator = GObject.registerClass(
class ThemeIndicator extends QuickSettings.SystemIndicator {
  _init() {
    super._init();

    this._toggle = new QuickSettings.QuickMenuToggle({
      title: 'Omakub Theme',
      iconName: 'omakub-theme-symbolic',
      menuEnabled: true,
    });

    try {
      this._toggle.setToggleMode(false);
    } catch (_) {
      this._toggle.toggleMode = false;
    }

    this._toggle.connect('clicked', () => {
      this._toggle.menu.open();
    });

    this._toggle.menu.connect('open-state-changed', () => {
      this._rebuildMenu();
    });

    this.quickSettingsItems.push(this._toggle);
    this._rebuildMenu();
  }

  _rebuildMenu() {
    this._toggle.menu.removeAll();

    const basePath = getBasePath();
    const themes = listThemes(basePath);

    if (themes.length === 0) {
      const item = new PopupMenu.PopupMenuItem('No themes found', { reactive: false });
      this._toggle.menu.addMenuItem(item);
      return;
    }

    themes.forEach(theme => {
      const item = new PopupMenu.PopupMenuItem(titleCase(theme));
      item.connect('activate', () => {
        applyTheme(basePath, theme);
      });
      this._toggle.menu.addMenuItem(item);
    });
  }
});

export default class OmakubThemeExtension extends Extension {
  enable() {
    this._indicator = new ThemeIndicator();
    Main.panel.statusArea.quickSettings.addExternalIndicator(this._indicator);
  }

  disable() {
    if (this._indicator) {
      this._indicator.destroy();
      this._indicator = null;
    }
  }
}
