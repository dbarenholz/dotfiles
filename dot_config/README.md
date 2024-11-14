## ~/.config

This is the `.config` folder, which includes many different configuration files.
See the individual READMEs in the folders for more information.

- `mimeapps.list`: Specifies default applications per [MIME](<https://wiki.archlinux.org/title/XDG_MIME_Applications>) type.
- `README.md`: You're reading it

### ~/.config/chezmoi

This configures [chezmoi](<https://www.chezmoi.io/>), my dotfile manager.
I've modified the behaviour of `chezmoi edit` to always use the `--watch` and `--apply` flag.
Because chezmoi doesn't allow me to add any file from `.config/chezmoi`, I've described it here.

```jsonc
{
  "edit": {
    "apply": true,   // Always apply changes on exit when using `chezmoi edit`
    "watch": true   // Automatically apply changes on-save.
  }
}
```
