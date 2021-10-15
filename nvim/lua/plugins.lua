return require('packer').startup({function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Changes Vim working directory to project root
    use 'airblade/vim-rooter'

    -- Nvim Treesitter configurations and abstraction layer
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- collection of language packs for Vim
    use 'sheerun/vim-polyglot'

    -- Requirements File Format syntax support for Vim
    use 'raimon49/requirements.txt.vim'

    -- colorschemes

    use 'frenzyexists/aquarium-vim'
    use 'tomasiser/vim-code-dark'
    use 'sainnhe/gruvbox-material'
    use 'jacoborus/tender.vim'
    use 'mhartington/oceanic-next'



    use 'Elethom/midnight.vim'

    use 'crusoexia/vim-monokai'
    use 'srcery-colors/srcery-vim'
    use 'nanotech/jellybeans.vim'
    use 'ajmwagar/vim-deus'
    -- use 'sonph/onehalf'

    use 'sjl/badwolf'
    use 'rakr/vim-one'

    use "rafamadriz/neon"

    use "projekt0n/github-nvim-theme"
    -- use 'morhetz/gruvbox'
    -- use 'joshdick/onedark.vim'
    -- use 'navarasu/onedark.nvim'
    -- use 'savq/melange'
    use 'gruvbox-community/gruvbox'
    -- use 'wojciechkepka/bogster'
    --    use 'arzg/vim-colors-xcode'
    use 'NLKNguyen/papercolor-theme'
    -- use 'arcticicestudio/nord-vim'
    -- use 'lifepillar/vim-solarized8'
    -- use 'Rigellute/rigel'
    -- use 'sainnhe/edge'
    use 'w0ng/vim-hybrid'
    use 'bluz71/vim-nightfly-guicolors'
    use 'haishanh/night-owl.vim'
    use 'sainnhe/everforest'
    use 'Pocco81/Catppuccino.nvim'
    -- use 'sainnhe/sonokai'
    -- use 'mihaifm/4colors'
    use 'phanviet/vim-monokai-pro'
    use 'bluz71/vim-moonfly-colors'
    -- use 'overcache/NeoSolarized'
    -- use 'folke/tokyonight.nvim', { 'branch': 'main' }

    -- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
    use 'ryanoasis/vim-devicons'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    -- use 'pbogut/fzf-mru.vim'

    -- plugin for the Perl module / CLI script 'ack'
    use 'mileszs/ack.vim'

    -- A text searching plugin mimics Ctrl-Shift-F on Sublime Text 2
    use 'dyng/ctrlsf.vim'

    -- All the lua functions I don't want to write twice.
    use 'nvim-lua/plenary.nvim'
    -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/popup.nvim'

    -- fuzzy finder
    use 'nvim-telescope/telescope.nvim'
    -- FZY sorter for telescope written in c
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'gbrlsnchs/telescope-lsp-handlers.nvim'

    -- FZF sorter for telescope written in c
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- use 'fannheyward/telescope-coc.nvim'
    -- use 'ThePrimeagen/harpoon'

    -- A async completion framework aims to provide completion to neovim's
    -- built in LSP written in Lua
    -- use 'nvim-lua/completion-nvim'

    -- configurations for the Nvim LSP client
    use 'neovim/nvim-lspconfig'

    -- Auto completion Lua plugin for nvim
    -- use 'hrsh7th/nvim-compe'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    -- For vsnip user.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- lsp plugin based on neovim built-in lsp with highly a performant UI.
    use 'glepnir/lspsaga.nvim'

    -- Check syntax in Vim asynchronously and fix files, with Language Server
    -- Protocol (LSP) support
    -- use 'w0rp/ale'

    -- Nodejs extension host for vim & neovim, load extensions like VSCode and host
    -- language servers
    -- use 'neoclide/coc.nvim'

    -- A tree explorer plugin for vim.
    use 'preservim/nerdtree'
    -- A plugin of NERDTree showing git status
    use 'xuyuanp/nerdtree-git-plugin'
    -- Extra syntax and highlight for nerdtree files
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    -- Seamless navigation between tmux panes and vim splits
    use 'christoomey/vim-tmux-navigator'

    -- use 'majutsushi/tagbar'
    use 'preservim/tagbar'

    -- Comment stuff out
    use 'tpope/vim-commentary'
    -- "surroundings": parentheses, brackets, quotes, XML tags, and more
    use 'tpope/vim-surround'
    -- Vim plugin that provides additional text objects
    use 'wellle/targets.vim'
    -- enable repeating supported plugin maps with "."
    use 'tpope/vim-repeat'
    -- Pairs of handy bracket mappings
    use 'tpope/vim-unimpaired'

    -- Vim plugin, insert or delete brackets, parens, quotes in pair
    use 'jiangmiao/auto-pairs'

    -- shows a git diff in the sign column
    use 'airblade/vim-gitgutter'

    -- A vim plugin to display the indention levels with thin vertical lines
    -- use 'yggdroot/indentline'

    -- Better Rainbow Parentheses
    -- use 'kien/rainbow_parentheses.vim'

    -- Rainbow parentheses for neovim using tree-sitter
    use 'p00f/nvim-ts-rainbow'

    -- Vim plugin for automatically highlighting other uses of the word under the cursor
    use 'RRethy/vim-illuminate'

    -- A Vim plugin for Vim plugins
    -- use 'tpope/vim-scriptease'

    -- Maximizes and restores the current window in Vim
    use 'szw/vim-maximizer'

    -- A multi-language debugging system for Vim
    -- use 'puremourning/vimspector'

    -- Toggle zoom in / out individual windows (splits)
    -- use 'dhruvasagar/vim-zoom'

    -- premier Vim plugin for Git. Or the premier Git plugin for Vim
    use 'tpope/vim-fugitive'

    -- lean & mean status/tabline for vim that's light as air
    use 'vim-airline/vim-airline'


    -- A collection of themes for vim-airline
    use 'vim-airline/vim-airline-themes'

    -- Vim plugin for working with python virtualenvs
    -- use 'jmcantrell/vim-virtualenv'

    -- Vim plugin to sort python imports using
    use 'fisadev/vim-isort'

    -- Async isort plugin for Vim + Neovim
    -- use 'brentyi/isort.vim'

    -- The uncompromising Python code formatter
    use 'psf/black'

    -- snippets files for various programming languages
    use 'honza/vim-snippets'
    -- ultimate solution for snippets in Vim
    use 'sirver/ultisnips'

    -- use 'mxw/vim-jsx'

    -- JavaScript bundle for vim, this bundle provides syntax highlighting and
    -- improved indentation.
    use 'pangloss/vim-javascript'
    -- use 'leafgarland/typescript-vim'
    -- use 'peitalin/vim-jsx-typescript'
    -- use 'styled-components/vim-styled-components', { 'branch': 'main' }
    -- use 'jparise/vim-graphql'
    -- use 'othree/html5.vim'
    -- use 'RishabhRD/popfix'
    -- use 'RishabhRD/nvim-lsputils'

    -- use 'prettier/vim-prettier', { 'do': 'yarn install' }

    -- A (Neo)vim plugin for formatting code.
    use 'sbdchd/neoformat'

    -- use 'yamatsum/nvim-cursorline'
    -- use 'APZelos/blamer.nvim'
    -- use 'machakann/vim-highlightedyank'

    -- use 'tpope/vim-markdown'

    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = 'kyazdani42/nvim-web-devicons',
    --     config = function() require'nvim-tree'.setup {} end
    -- }

    -- Neovim plugin that peeks lines of the buffer in non-obtrusive way
    use 'nacro90/numb.nvim'
    -- use 'ray-x/aurora'
    -- use 'justinmk/vim-sneak'

    -- use 'vifm/vifm.vim'
    -- use 'easymotion/vim-easymotion'

    -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document
    -- with as few keystrokes as possible
    use 'phaazon/hop.nvim'

    -- use 'sonph/onehalf'

    -- use 'tpope/vim-sleuth'
    -- use 'tpope/vim-abolish'
    -- Improvements to the handling of Django related files in Vim
    use 'tweekmonster/django-plus.vim'

    -- use 'adelarsq/vim-devicons-emoji'
    -- use 'abecodes/tabout.nvim'
    -- use 'liuchengxu/vim-which-key'
    -- use 'karb94/neoscroll.nvim'

    -- The undo history visualizer for VIM
    use 'mbbill/undotree'

    -- Clean and elegant distraction-free writing for NeoVim
    use 'Pocco81/TrueZen.nvim'

    use { 'ibhagwan/fzf-lua',
        requires = {
        'vijaymarupudi/nvim-fzf'} -- optional for icons
    }

    -- Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP,
    -- unite, Denite, lightline, vim-startify and many more
    use 'kyazdani42/nvim-web-devicons'

    -- A tree like view for symbols in Neovim using the Language Server Protocol
    use 'simrat39/symbols-outline.nvim'

    -- Rainbow Parentheses Improved
    use 'luochen1990/rainbow'
    -- use 'thiagoalessio/rainbow_levels.vim'
    -- use 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
    -- use 'rhysd/git-messenger.vim'
    -- use 'ctrlpvim/ctrlp.vim'
    -- use {
    --     "blackCauldron7/surround.nvim",
    --     config = function()
    --         require "surround".setup {}
    --     end
    -- }
    -- use 'alexaandru/nvim-lspupdate'
    -- use 'michaelb/sniprun', {'do': 'bash install.sh'}

    -- A pretty list for showing diagnostics, references, telescope results,
    -- quickfix and location lists to help you solve all the trouble your code
    -- is causing
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
            }
        end
    }
    -- Automatically creates missing LSP diagnostics highlight groups for color
    -- schemes that don't yet support the Neovim 0.5 builtin lsp client
    use 'folke/lsp-colors.nvim'

    -- This plugin adds indentation guides to all lines (including empty lines).
    use "lukas-reineke/indent-blankline.nvim"
    use 'tamago324/lir.nvim'
    -- use {
    --     'rmagatti/session-lens',
    --     requires = {'rmagatti/auto-session'},
    --     config = function()
    --         require('session-lens').setup({--[[your custom config--]]})
    --     end
    -- }

    -- use {'akinsho/bufferline.nvim',}
    -- use {'jdhao/better-escape.vim', event = 'InsertEnter'}

    -- better % fist_oncoming navigate and highlight matching words
    -- fist_oncoming modern matchit and matchparen replacement
    use 'andymass/vim-matchup'

    -- use {
    --     "nvim-telescope/telescope-frecency.nvim",
    --     config = function()
    --         require"telescope".load_extension("frecency")
    --     end,
    --     requires = {"tami5/sqlite.lua"}
    -- }


    -- vscode-like pictograms for neovim lsp completion items
    use 'onsails/lspkind-nvim'

    -- minimap / scrollbar for vim
    use 'wfxr/minimap.vim'




    -- start markdown development

    -- tabular plugin is used to format tables
    -- Vim script for text filtering and alignment
    use 'godlygeek/tabular'

    -- JSON front matter highlight plugin Distinct highlighting of keywords vs
    -- values, JSON-specific (non-JS) warnings, quote concealing.
    use 'elzr/vim-json'
    -- Syntax highlighting, matching rules and mappings for the original Markdown
    -- and extensions.
    use 'plasticboy/vim-markdown'
    -- Distraction-free writing in Vim
    use 'junegunn/goyo.vim'
    -- Hyperfocus-writing in Vim
    use 'junegunn/limelight.vim'

    -- A complete environment to create Markdown files with a syntax highlight that
    -- doesn't suck!
    -- use 'gabrielelana/vim-markdown'

    -- use 'vim-pandoc/vim-pandoc'
    -- use 'vim-pandoc/vim-pandoc-syntax'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

    -- use 'instant-markdown/vim-instant-markdown'
    -- use 'reedes/vim-pencil'
    use 'skanehira/preview-markdown.vim'

    -- end markdown development

    -- Auto-Focusing and Auto-Resizing Splits/Window
    -- use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }

    -- Better whitespace highlighting for Vim
    -- use 'ntpeters/vim-better-whitespace'
    -- use {
    --     'numToStr/Navigator.nvim',
    --     config = function()
    --         require('Navigator').setup()
    --     end
    -- }
    -- use { 'camspiers/snap', rocks = {'fzy'}}
    use 'notomo/gesture.nvim'

    -- Find the enemy and replace them with dark power
    use 'windwp/nvim-spectre'
    -- use {
    --     'winston0410/mark-radar.nvim',
    --     require("mark-radar").setup{
    --         -- your options here, such as:
    --         -- highlight_group = "<group_name>"
    --    }
    -- }

    use 'kshenoy/vim-signature'

    use 'voldikss/vim-floaterm'
    use 'windwp/nvim-ts-autotag'
    use {'edluffy/specs.nvim'}

    -- use {'ms-jpq/coq_nvim', branch = 'coq'}
    -- use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    -- use {'ms-jpq/coq.thirdparty', branch = '3p'}

end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
