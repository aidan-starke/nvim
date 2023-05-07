# nvim-config

### Installing plugins

Plugins are managed with [lazy](https://github.com/folke/lazy.nvim)

- Plugins are setup in `lua/setup/lazy.lua`
- Run `:Lazy` to manage / update

As [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) depends on `nightly` build of neovim I recommend setting up some aliases like the following

```
alias nvconfig="nv $HOME/.config/nvim"
alias nv="$HOME/nvim-macos/bin/nvim"
alias nvupdate="$HOME/.config/nvim/nightly.sh"
```

The `nightly.sh` script installs neovim nightly (macos) in your root directory
