use gtk4::prelude::*;
use gtk4::{Application, ApplicationWindow, Box as GtkBox, Button, Label, ListBox, ListBoxRow, Orientation};
use std::fs;
use std::process::Command;

fn theme_root() -> String {
    if let Ok(path) = std::env::var("OMAKUB_PATH") {
        return path;
    }
    let home = std::env::var("HOME").unwrap_or_else(|_| String::from("/home"));
    format!("{}/.local/share/omakub", home)
}

fn title_case(input: &str) -> String {
    input
        .split('-')
        .map(|part| {
            let mut chars = part.chars();
            match chars.next() {
                None => String::new(),
                Some(first) => first.to_uppercase().collect::<String>() + chars.as_str(),
            }
        })
        .collect::<Vec<String>>()
        .join(" ")
}

fn list_themes(base: &str) -> Vec<String> {
    let theme_dir = format!("{}/themes", base);
    let mut themes: Vec<String> = vec![];

    if let Ok(entries) = fs::read_dir(&theme_dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.is_dir() {
                let name = entry.file_name().to_string_lossy().to_string();
                let gnome_path = path.join("gnome.sh");
                if gnome_path.exists() {
                    themes.push(name);
                }
            }
        }
    }

    themes.sort();
    themes
}

fn build_ui(app: &Application) {
    let base = theme_root();
    let themes = list_themes(&base);
    let themes_rc = themes;

    let window = ApplicationWindow::builder()
        .application(app)
        .title("Omakub Theme Switcher")
        .default_width(480)
        .default_height(560)
        .build();

    let container = GtkBox::new(Orientation::Vertical, 12);
    container.set_margin_top(16);
    container.set_margin_bottom(16);
    container.set_margin_start(16);
    container.set_margin_end(16);

    let header = Label::new(Some("Pick a theme"));
    header.set_xalign(0.0);
    header.add_css_class("title-2");

    let list = ListBox::new();
    list.set_selection_mode(gtk4::SelectionMode::Single);

    for theme in themes_rc.iter() {
        let row = ListBoxRow::new();
        let label = Label::new(Some(&title_case(theme)));
        label.set_xalign(0.0);
        label.add_css_class("title-4");
        row.set_child(Some(&label));
        list.append(&row);
    }

    let status = Label::new(Some(""));
    status.set_xalign(0.0);

    let button = Button::with_label("Apply theme");
    button.add_css_class("suggested-action");

    let status_rc = status.clone();
    let button_rc = button.clone();
    let list_rc = list.clone();
    let themes_for_apply = themes_rc.clone();
    let base_path = base.clone();

    button.connect_clicked(move |_| {
        let selected = list_rc.selected_row();
        let Some(row) = selected else {
            status_rc.set_text("Select a theme first.");
            return;
        };

        let idx = row.index();
        let theme = themes_for_apply.get(idx as usize).cloned().unwrap_or_default();
        if theme.is_empty() {
            status_rc.set_text("Invalid selection.");
            return;
        }

        status_rc.set_text(&format!("Applying {}...", title_case(&theme)));
        button_rc.set_sensitive(false);

        let apply_path = format!("{}/themes/apply-theme.sh", base_path);
        let command = format!("source \"{}\" \"{}\"", apply_path, theme);
        let result = Command::new("bash")
            .arg("-lc")
            .arg(command)
            .env("OMAKUB_SZAMSKI_PATH", &base_path)
            .status();

        let message = match result {
            Ok(status) if status.success() => "Theme applied.".to_string(),
            Ok(status) => format!("Failed (exit {}).", status.code().unwrap_or(1)),
            Err(err) => format!("Failed: {}", err),
        };

        status_rc.set_text(&message);
        button_rc.set_sensitive(true);
    });

    container.append(&header);
    container.append(&list);
    container.append(&button);
    container.append(&status);

    window.set_child(Some(&container));
    window.show();
}

fn main() {
    let app = Application::builder()
        .application_id("io.omakub.ThemeSwitcher")
        .build();

    app.connect_activate(build_ui);
    app.run();
}
