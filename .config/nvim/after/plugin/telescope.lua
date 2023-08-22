local builtin = require('telescope.builtin')
local state = true

vim.keymap.set('n', '<leader>.', function()
    builtin.find_files({ hidden = state});
end)

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


