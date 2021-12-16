-- maps.lua

-- map the leader key
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', 'jk', '<ESC>l', {})

vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>F', 'mzgg=G`z', {noremap = true})

vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('n', '\\', ';', {noremap = true})

-- sometimes this happens and I hate it
vim.api.nvim_set_keymap('', ':Vs', ':vs', {})
vim.api.nvim_set_keymap('', ':Sp', ':sp', {})
