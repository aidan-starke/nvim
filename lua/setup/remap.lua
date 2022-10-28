local nnoremap = require("setup.keymap").nnoremap

-- Focus Tree
nnoremap("<leader>ft", "<cmd>NvimTreeToggle<CR>")

-- Select All
nnoremap("<leader>sa", "gg<S-v>G")
-- Redo
nnoremap("<leader>re", "<cmd>redo<CR>")

-- Focus
nnoremap("<leader>st", "<cmd>FocusToggle<CR>")
nnoremap("<leader>ss", "<cmd>FocusSplitNicely<CR>")
nnoremap("<leader><leader>", "<cmd>FocusSplitCycle<CR>")
-- Move to left split tab
nnoremap("<leader>sh", "<C-w>h")
-- Move to right split tab
nnoremap("<leader>sl", "<C-w>l")
-- Move to top split tab
nnoremap("<leader>sk", "<C-w>k")
-- Move to bottom split tab
nnoremap("<leader>sj", "<C-w>j")

-- New tab
nnoremap("<leader>tn", ":tabedit ")
-- Switch to right tab
nnoremap("<leader>tk", "<cmd>tabnext<CR>")
-- Switch to left tab
nnoremap("<leader>tj", "<cmd>tabprevious<CR>")

-- Markdown
nnoremap("<leader>md", "<cmd>MarkdownPreviewToggle<CR>")

-- Illuminate
nnoremap("<leader>in", "<cmd>lua require('illuminate').next_reference{wrap=true}<CR>")
nnoremap("<leader>ip", "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<CR>")
