-- maps.lua

-- map the leader key
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', 'jk', '<ESC>l', {})

vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<cr>', {noremap = true})

-- buffer prev/next
-- vim.api.nvim_set_keymap('n', '<c-x>', ':bnext<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<c-z>', ':bprev<cr>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '*', '*N', {noremap = true})
-- vim.api.nvim_set_keymap('n', '#', '#N', {noremap = true})
-- vim.api.nvim_set_keymap('n', '#', '#N', {noremap = true})

-- vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>F', 'mzgg=G`z', {noremap = true})

vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('n', '\\', ';', {noremap = true})

-- sometimes this happens and I hate it
vim.api.nvim_set_keymap('', ':Vs', ':vs', {})
vim.api.nvim_set_keymap('', ':Sp', ':sp', {})

-- Do not show stupid q: window
-- vim.api.nvim_set_keymap('', ':q', ':q', {})

-- vim.api.nvim_set_keymap('', '<c-p>', ':lua require("fzf-lua").files()<CR>', {noremap = true, silent=true})
-- vim.api.nvim_set_keymap('', '<c-p>', ':Files<CR>', {noremap = true, silent=true})
-- vim.api.nvim_set_keymap('', '<c-p>', '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('n', '<c-b>', ':Buffers<CR>', {noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<c-f>', ':Lines<CR>', {noremap = true, silent=true})
