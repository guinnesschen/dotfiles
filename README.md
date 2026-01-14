# dotfiles

Bootstrap (macOS/Linux):

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <github-user>/<repo>
```

Common commands:

```
chezmoi apply
chezmoi update
chezmoi diff
chezmoi add ~/.zshrc
```

What this repo configures:
- zsh + Oh My Zsh + Powerlevel10k (uses `~/.p10k.zsh`)
- tmux config + TPM (run `prefix + I` inside tmux to install plugins)
- Neovim config in `~/.config/nvim` (plugins install on first launch)
- iTerm2 prefs from `~/.config/iterm2` (restart iTerm2 after apply)
- bat themes in `~/.config/bat`
- GitHub CLI config in `~/.config/gh` (excludes auth tokens)
- Cursor settings and keybindings
- Cursor profile files (settings, keybindings, extensions)
- Homebrew packages via `~/.Brewfile`
- Extra repos: `~/.fzf` (fzf-git) and `~/color_themes/kanagawa.nvim` (via run-once scripts)

Notes:
- Powerlevel10k requires a Nerd Font; set one in your terminal settings.
- macOS-only scripts are no-ops on Linux; shell/tmux configs still apply.
