local nnoremap = require("setup.keymap").nnoremap
local xnoremap = require("setup.keymap").xnoremap
local silentOpts = { silent = true }

-- Focus Tree
nnoremap("<leader>ft", "<cmd>NvimTreeToggle<CR>")

-- Select All
nnoremap("<leader>sa", "gg<S-v>G")
-- Redo
nnoremap("<leader>re", "<cmd>redo<CR>")
-- Paste & keep clipboard
xnoremap("<leader>p", "\"_dP")

-- Split down
nnoremap("<leader>sd", ":split<Return><C-w>w", silentOpts)
-- Split right
nnoremap("<leader>sr", ":vsplit<Return><C-w>w", silentOpts)

-- Switch split tab
nnoremap("<leader> ", "<C-w>w")
-- Move to left split tab
nnoremap("<leader>s<left>", "<C-w>h")
nnoremap("<leader>sh", "<C-w>h")
-- Move to right split tab
nnoremap("<leader>s<right>", "<C-w>l")
nnoremap("<leader>sl", "<C-w>l")
-- Move to top split tab
nnoremap("<leader>s<up>", "<C-w>k")
nnoremap("<leader>sk", "<C-w>k")
-- Move to bottom split tab
nnoremap("<leader>s<down>", "<C-w>j")
nnoremap("<leader>sj", "<C-w>j")
-- Resize split tab
nnoremap("<leader>rh", "<C-w>>")
nnoremap("<leader>r<left>", "<C-w>>")
nnoremap("<leader>rl", "<C-w><")
nnoremap("<leader>r<right>", "<C-w><")
nnoremap("<leader>rk", "<C-w>+")
nnoremap("<leader>r<up>", "<C-w>+")
nnoremap("<leader>rj", "<C-w>-")
nnoremap("<leader>r<down>", "<C-w>-")

--New tab
nnoremap("<leader>tn", ":tabedit")
-- Switch to right tab
nnoremap("<leader>t<right>", ":tabnext<CR>")
nnoremap("<leader>tl", ":tabnext<CR>")
-- Switch to left tab
nnoremap("<leader>t<left>", ":tabprevious<CR>")
nnoremap("<leader>th", ":tabprevious<CR>")

-- Cheatsheet
nnoremap("<leader>cs", "<cmd>Cheatsheet<CR>")

-- Gitsigns
nnoremap("<leader>gs", "<cmd>Gitsigns<CR>")

-- Markdown
nnoremap("<leader>md", "<cmd>MarkdownPreviewToggle<CR>")

-- Minimap
nnoremap("<leader>mo", "<cmd>MinimapToggle<CR>")
