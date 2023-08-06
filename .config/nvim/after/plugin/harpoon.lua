local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>jh", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>jt", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>jn", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>js", function() ui.nav_file(4) end)
