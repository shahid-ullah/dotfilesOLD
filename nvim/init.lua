require('plugins')
require('options')
require('mappings')
-- require('maps')
-- require('mappings')
require('custom_functions')

-- plugins
require('config.nvim-treesitter')
require('config.telescope')
require('config.cmp')
-- require('config.harpoon')
require('config.lspsaga')
require('config.Comment')
require('config.hop')
require('config.numb')
-- require('config.trouble')
require('config.fzf-lua')
require('config.lir')
-- require('config.nvim_transparent')
-- require('config.nvim-tree')
-- require('config.github-theme')
require('config.lsp-config')
require('config.goto_preview')
require('config.lspkind')
require('config.nvim-autopairs')
require('config.trouble')
require('config.gitsigns')

vim.cmd('source ~/.config/nvim/vim/general.vim')
vim.cmd('source ~/.config/nvim/vim/maps.vim')

-- Plugins
vim.cmd('source ~/.config/nvim/vim/theme/vim-hybrid.vim')
vim.cmd('source ~/.config/nvim/vim/vim-airline.vim')

vim.cmd('source ~/.config/nvim/vim/auto-commands.vim')
vim.cmd('source ~/.config/nvim/vim/custom-functions.vim')
vim.cmd('source ~/.config/nvim/vim/commands.vim')

vim.cmd('source ~/.config/nvim/vim/nvim-hlslens.vim')
vim.cmd('source ~/.config/nvim/vim/ack.vim')
vim.cmd('source ~/.config/nvim/vim/tagbar.vim')
vim.cmd('source ~/.config/nvim/vim/black.vim')
vim.cmd('source ~/.config/nvim/vim/isort.vim')

vim.cmd('source ~/.config/nvim/vim/fzf.vim')
vim.cmd('source ~/.config/nvim/vim/telescope.vim')

vim.cmd('source ~/.config/nvim/vim/vim-maximizer.vim')
vim.cmd('source ~/.config/nvim/vim/hop.vim')
vim.cmd('source ~/.config/nvim/vim/lir.vim')
vim.cmd('source ~/.config/nvim/vim/harpoon.vim')
vim.cmd('source ~/.config/nvim/vim/nerdtree.vim')
vim.cmd('source ~/.config/nvim/vim/nerdtree-git-plugin.vim')
vim.cmd('source ~/.config/nvim/vim/undotree.vim')
vim.cmd('source ~/.config/nvim/vim/lspsaga.vim')
vim.cmd('source ~/.config/nvim/vim/trouble.vim')
vim.cmd('source ~/.config/nvim/vim/limelight.vim')
vim.cmd('source ~/.config/nvim/vim/lsp.vim')

-- uncategorized
vim.cmd('source ~/.config/nvim/vim/uncategorized.vim')

vim.cmd('colorscheme tokyonight')
