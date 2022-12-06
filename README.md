# nvim-config

### Installing plugins

Plugins are managed with [packer](https://github.com/wbthomason/packer.nvim)

- Open up `lua/setup/packer.lua` in vim/neovim
- Enter the following commands

```
:so
:PackerSync
```

As [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) depends on `nightly` build of neovim I recommend setting up some aliases like the following

```
alias nvconfig="nv $HOME/.config/nvim"
alias nv="$HOME/nvim-macos/bin/nvim"
alias nvupdate="$HOME/.config/nvim/nightly.sh"
```

The `nightly.sh` script installs neovim nightly (macos) in your root directory
