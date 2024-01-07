# sway

The window manager I use is [sway](https://github.com/swaywm/sway).

## Config

My configuration is split up in the following files. 
The `config.d` directory is `~/.config/sway/config.d/`.
The `scripts` directory is `~/.config/sway/scripts/`

1. `config`: The main configuration. This includes all other config files.
2. `config.d/10-keybinds.conf`: Basic keybinds live here (non-standard, usually in `config`).
3. `config.d/10-input.conf`: Input configuration (`sway-input`).
4. `config.d/10-output.conf`: Output configuration (`swaybg`).
5. `confid.g/20-ricing.conf`: Changes visuals of sway.
5. `config.d/50-rules-browser.conf`: Specific rules for browser windows. These are used to not go into idle mode when fullscreen, among others.
6. `config.d/50-rules-pavucontrol.conf`: Display `pavucontrol` as a floating window.
7. `config.d/50-rules-policykit-agent.conf`: Display policy-kit as floating window.
8. `config.d/60-bindings-brightness.conf`: Keybinds for `light`, to control screen brightness.
9. `config.d/60-bindings-media.conf`: Keybinds for controlling media with `playerctl`.
10. `config.d/60-bindings-screenshot.conf`: Default keybinds for screenshots with `grimshot`
    _Note_: I don't use grimshot, so this file is empty.
11. `config.d/60-bindings-volume.conf`: Keybinds for controlling volume with `pactl`.
11. `config.d/65-mode-passthrough.conf`: A special mode for passing keybinds to an application.
    _Note_: I don't use this, so the file is empty.
12. `config.d/90-bar.conf`: Configuration for what bar to use (`waybar`).
13. `config.d/90-swayidle.conf`: Configuration for idle and lockscreen behaviour (`swayidle`, `swaylock`).
14. `config.d/95-autostart-policykit-agent.conf`: Starts agent for PolicyKit.
15. `config.d/95-xdg-desktop-autostart.conf`: A hack to make XDG autostart entries work.
16. `config.d/95-xdg-user-dirs.conf`: Update user dirs when sway starts.

- [ ] TODO: actually organise stuff according to what I wrote above.
