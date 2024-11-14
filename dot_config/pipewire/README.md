## ~/.config/pipewire

[pipewire](<https://wiki.archlinux.org/title/PipeWire>) is a multimedia framework that I'm using for audio playback.
I've spent _considerable_ time modifying it, which has resulted in the following changes:

- Limit volume to 100% in `./client-rt.conf.d/50-volume-limit.conf` and `./pipewire-pulse.conf.d/50-volume-limit.conf` for alsa and pulse streams respectively.
- Enable more playback rates in `./pipewire.conf.d/10-rates.conf`, see [this article](<https://www.izotope.com/en/learn/digital-audio-basics-sample-rate-and-bit-depth.html>) for details on what that means.
- Tell Discord to not modify audio in `./pipewire-pulse.conf.d/50-volume-block.conf`.

See also my [wireplumber](<https://github.com/dbarenholz/dotfiles/tree/main/dot_config/wireplumber>) configuration.
