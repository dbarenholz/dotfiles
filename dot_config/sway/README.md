## ~/.config/sway

The window manager I use is [sway](https://github.com/swaywm/sway).

### Configuration

My configuration is split up in a few separate files.
I am using _only_ files from `~/.dotfiles/.config/sway`, so this configuration is fully reproducible on other systems.

This means that the `config.d` directory is `~/.config/sway/config.d/` as opposed to `/etc/sway/config.d/` or something silly.
Besides the default files from `config.d` (including those from [sway-systemd](https://github.com/alebastr/sway-systemd)), I use the following:

* `autostart.conf` : Provides statements for autostarting programs.
* `colors.conf` : Change colours of sway windows and borders.
* `hotkeys.conf` : Extra hotkeys for custom stuff, that does not fit in `keybinds.conf`
* `input.conf` : Sway's input configuration
* `keybinds.conf` : Sway's basic keybinds. Hotkeys for my own stuff lives in `hotkeys.conf`.
* `output.conf` : Sway's output configuration
* `program_rules.conf` : Tells sway on which workspaces programs should open by default.
