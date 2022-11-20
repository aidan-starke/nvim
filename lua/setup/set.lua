vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = false
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 15
vim.opt.smartindent = true

vim.opt.wrap = false

vim.g.mapleader = " "

vim.opt.clipboard:append { 'unnamedplus' }

vim.opt.updatetime = 50

vim.g.Illuminate_ftblacklist = { 'NvimTree' }

vim.opt.wildmenu = true
vim.opt.wildmode = { 'longest', 'full', 'full' }

vim.g.copilot_node_command = '/usr/local/Cellar/node@16/16.18.1/bin/node'
