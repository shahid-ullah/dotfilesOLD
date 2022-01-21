-- maps.lua
local opts = {noremap=true, silent=true}
local keymap = vim.api.nvim_set_keymap

-- map the leader key
keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

keymap('n', 'Q', '<nop>', opts)
keymap('i', 'jk', '<ESC>l', opts)

keymap('n', '<esc>', ':nohlsearch<cr>', {noremap = true})

keymap('n', '<leader>F', 'mzgg=G`z', {noremap = true})

keymap('n', ';', ':', {noremap = true})
keymap('n', '\\', ';', {noremap = true})

-- sometimes this happens and I hate it
keymap('', ':Vs', ':vs', {})
keymap('', ':Sp', ':sp', {})
