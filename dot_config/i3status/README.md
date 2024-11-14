## ~/.config/i3status

[`i3status`](<https://wiki.archlinux.org/title/I3#4.3>) is a simple status _thing_ for use with (amongst others) [`i3bar`](<https://i3wm.org/docs/userguide.html#_configuring_i3bar>).
It decides which textual elements are shown in the bar.

### Configuration

There is only a single simple config file.

Roughly speaking, I do the following:
1. Tell `i3status` that I use `i3bar`, that it should output colors, and update every 5 seconds.
2. Tell `i3status` I want to display components for my battery, volume, and date&time.
3. Tell `i3status` how to configure each of the above components.

