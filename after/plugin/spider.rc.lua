local status, spider = pcall(require, 'spider')
if (not status) then return end

vim.keymap.set({ "n", "o", "x" }, "sw", function() spider.motion("w") end, { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "se", function() spider.motion("e") end, { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "sb", function() spider.motion("b") end, { desc = "Spider-b" })
