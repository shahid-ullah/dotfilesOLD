
-----------------------------------------------------------
-- Neovim settings
--- General Neovim settings and configuration
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options
local map = vim.api.nvim_set_keymap

vim.opt.path = vim.opt.path + "**"

vim.g.polyglot_disabled ={'autoindent'}
vim.api.nvim_command('filetype off')
vim.api.nvim_command('filetype plugin on')
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')
vim.api.nvim_command('syntax on')

-- Configurations General
-- map the leader key
-- vim.api.nvim_set_keymap('n', '<Space>', '', {})
-- vim.g.mapleader = " "

vim.opt.mouse = 'a'

vim.o.number = true
vim.o.relativenumber = true

vim.o.encoding = 'utf-8'

vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.smartcase = true
-- vim.o.timeoutlen = 500

vim.opt.wildmenu = true
vim.opt.wildmode = {'longest', 'list', 'full'}  -- Command-line completion mode

vim.opt.wildignore = {'*/cache/*', '*/tmp/*', '*.pyc', '*_build/*', '**/coverage/*', '**/node_modules/*', '**/android/*', '**/ios/*', '**/.git/*'}

vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.scrolloff = 6


vim.o.laststatus = 2
vim.o.title = true
vim.o.cursorline = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smarttab = true
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = {'79', '119'}

vim.o.showcmd = true
vim.o.showmode = true

-- swap and backup file options
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.wrap = false
vim.o.linebreak = true


vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10

vim.o.hidden = true
vim.o.confirm = true
vim.o.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)

vim.api.nvim_set_keymap('n', '<Space>', '', {})



-- Configurations: Plugin indent-blankline.nvim
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_end_of_line = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
-- end Configurations
