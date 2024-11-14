## ~/.config/wireplumber

[wireplumber](<https://wiki.archlinux.org/title/WirePlumber>) manages [pipewire](<https://wiki.archlinux.org/title/PipeWire>) sessions. It tries to do things for you, which you don't always want.

- Limit volume to 100% in `./wireplumber.conf.d/60-volume-limit.conf`  alsa nodes made by wireplumber.
- Tell wireplumber to not switch profiles in `./wireplumber.conf.d//99-bluetooth-autoswitch.conf`. This setting also disables switching for non-bluetooth devices.

See also my [pipewire](<https://github.com/dbarenholz/dotfiles/tree/main/dot_config/pipewire>) configuration.
