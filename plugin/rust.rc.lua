local silentOpts = { silent = true }
local nnoremap = require("setup.keymap").nnoremap

-- Rust specific keybindings
nnoremap("<leader>rh", "<cmd>RustSetInlayHints<CR>", silentOpts)
nnoremap("<leader>rhd", "<cmd>RustDisableInlayHints<CR>", silentOpts)
nnoremap("<leader>th", "<cmd>RustToggleInlayHints<CR>", silentOpts)
nnoremap("<leader>rr", "<cmd>RustRunnables<CR>", silentOpts)
nnoremap("<leader>rem", "<cmd>RustExpandMacro<CR>", silentOpts)
nnoremap("<leader>roc", "<cmd>RustOpenCargo<CR>", silentOpts)
nnoremap("<leader>rpm", "<cmd>RustParentModule<CR>", silentOpts)
nnoremap("<leader>rjl", "<cmd>RustJoinLines<CR>", silentOpts)
nnoremap("<leader>rha", "<cmd>RustHoverActions<CR>", silentOpts)
nnoremap("<leader>rhr", "<cmd>RustHoverRange<CR>", silentOpts)
nnoremap("<leader>rmd", "<cmd>RustMoveItemDown<CR>", silentOpts)
nnoremap("<leader>rmu", "<cmd>RustMoveItemUp<CR>", silentOpts)
nnoremap("<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<CR>", silentOpts)
nnoremap("<leader>rd", "<cmd>RustDebuggables<CR>", silentOpts)
nnoremap("<leader>rv", "<cmd>RustViewCRateGraph<Cr>", silentOpts)
nnoremap("<leader>rw", "<cmd>RustReloadWorkspace<CR>", silentOpts)
nnoremap("<leader>rss", "<cmd>RustSSR<CR>", silentOpts)
nnoremap("<leader>rxd", "<cmd>RustOpenExternalDocs<CR>", silentOpts)
