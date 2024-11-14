## ~/.config/i3

[`i3`](<https://wiki.archlinux.org/title/I3>) is the window manager I use when on a system running [X server](<https://wiki.archlinux.org/title/Xorg>) (for [wayland](<https://wiki.archlinux.org/title/Wayland>) I use [`sway`](<https://swaywm.org>)).
Here's how the configuration works. For details, check comments in the individual config files.


### Configuration

The `i3` configuration is split accross multiple files, roughly as follows:

```raw
$HOME/.config/i3/
  ├── autostart.conf
  ├── bar.conf
  ├── colors.conf
  ├── config
  ├── hotkeys.conf
  ├── keybinds.conf
  └── README.md
```

- In `autostart.conf` I execute programs that I want to run on start (e.g. syncthing).
- In `bar.conf` I tell `i3` to use [`polybar`](<https://github.com/polybar/polybar>) as its bar.
- In `colors.conf` I modify the colours of the windows and borders of `i3`.
- In `config`, the main configuration file, I set my modifier keys and then _include_ all other configs.
- In `hotkeys.conf` I have some extra hotkeys (bindings) that do not fit in `keybinds.conf`. Think volume, brightness, screenshots.
- In `keybinds.conf` I have the basic `i3` keybindings for moving windows and workspaces.
- In `README.md` I write about my configuration! You're reading it.

### Old

This section describes some configuration I no longer use.
These still live in the `old` folder, in case I want to go back to them.

- In `bar.conf` I configure my use of `i3bar`. See also my configuration for [`i3status`](<https://github.com/dbarenholz/dotfiles/tree/main/dot_config/i3status>).
