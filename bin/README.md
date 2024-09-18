# bin

This folder includes `scripts` for custom scripts I have made.

- `executable_backup.sh`: Quick and dirty script to backup to my server using local IP. Requires `rsync`.
- `executable_color-picker.sh`: A script for picking a color from the screen, for use in a Wayland session. Requires `slurp`, `grim`, and `magick`
- `executable_completer.sh`: A quick attempt at "snippet completion" that works system wide.
- `executable_fix-grub.sh`: A script mostly there to remind myself that I should tell grub windows doesn't exist.
- `executable_lock.sh`: A script that sets a blurred lockscreen when locked. Requires `grim` , `swaylock` and `magick`.
- `executable_mount-ssd.sh`: A script that mounts my SSD. I arguably should mess with fstab to have it automount, but I'm lazy.
- `executable_update.sh`: A script that attempts to do a system-wide update for flatpaks and distroboxes. Requires `flatpak` and `distrobox`.
