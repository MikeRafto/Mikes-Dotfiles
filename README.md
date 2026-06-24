# Just My Dotfiles

So, I decided to organize my system's configuration files into a central `~/dotfiles` directory, and protect them with git version controlling. For now, this includes my zsh, alacritty, tmux and neovim configurations.

I made the repo public, so you may have a look if you want!

## Installation
> [!WARNING] I'd suggest creating a quick backup of your files before you start playing!

### Apply dotfiles
First, clone this repo to your home directory:

```bash
git clone https://github.com/MikeRafto/dotfiles
```

You can enforce the repo configurations to your system using GNU stow:

```bash
# Install all configurations
stow --dotfiles */

# Install just a single package (eg nvim)
stow --dotfiles nvim

# Re-install a package
stow --dotfiles -R nvim
```

### Install Packages

Although we have applied the nvim-tmux-alacritty configurations, we still need to download their plugins and themes. In order to keep the package files outside this repo, I have configured these programs to store their packages at:

- `~/.local/share/nvim/*/` (which was the default anyway)
- `~/.local/share/tmux/plugins/`
- `~/.local/share/alacritty/themes/`

#### neovim

Just open nvim and run `:PlugInstall`

#### tmux

Install tpm at the correct location:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```

Then install the packages with `<CTRL+SPACE> I`. Tmux will freeze for a few seconds. Don't worry about that.

#### alacritty

Install the alacritty themes at the correct location:
```bash
git clone https://github.com/alacritty/alacritty-theme ~/.local/share/alacritty/themes
```
