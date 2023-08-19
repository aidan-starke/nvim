-- Speed up startup
vim.loader.enable()

vim.opt.guicursor = ""
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = false
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 15
vim.opt.smartindent = true

vim.opt.numberwidth = 3
vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

vim.opt.wrap = false

vim.g.mapleader = " "

vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.updatetime = 50

vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "full", "full" }

vim.g.copilot_node_command = "/opt/homebrew/Cellar/node@16/16.20.2/bin/node"
