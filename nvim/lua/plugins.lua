return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- You can specify multiple plugins in a single call

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'bluz71/vim-moonfly-colors'

    use 'sheerun/vim-polyglot'
    use 'raimon49/requirements.txt.vim'

    -- use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use 'navarasu/onedark.nvim'
    use 'savq/melange'
    use 'gruvbox-community/gruvbox'
    use 'wojciechkepka/bogster'
    --    use 'arzg/vim-colors-xcode'
    use 'NLKNguyen/papercolor-theme'
    use 'arcticicestudio/nord-vim'
    use 'lifepillar/vim-solarized8'
    use 'Rigellute/rigel'
    use 'sainnhe/edge'
    -- use 'folke/tokyonight.nvim', { 'branch': 'main' }

    use 'ryanoasis/vim-devicons'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'mileszs/ack.vim'
    -- use 'dyng/ctrlsf.vim'


    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'fannheyward/telescope-coc.nvim'
    -- use 'kyazdani42/nvim-web-devicons'
    -- use 'ThePrimeagen/harpoon'
    use 'airblade/vim-rooter'

    -- use 'nvim-lua/completion-nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'w0rp/ale'
    -- use 'neoclide/coc.nvim'


    use 'scrooloose/nerdtree'
    use 'xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    use 'christoomey/vim-tmux-navigator'
    use 'jiangmiao/auto-pairs'
    -- use 'majutsushi/tagbar'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'airblade/vim-gitgutter'
    use 'yggdroot/indentline'
    use 'kien/rainbow_parentheses.vim'
    use 'p00f/nvim-ts-rainbow'
    use 'RRethy/vim-illuminate'

    -- use 'tpope/vim-scriptease'
    use 'szw/vim-maximizer'
    use 'puremourning/vimspector'
    use 'dhruvasagar/vim-zoom'

    use 'tpope/vim-fugitive'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use 'jmcantrell/vim-virtualenv'
    use 'fisadev/vim-isort'
    use 'psf/black'

    use 'honza/vim-snippets'
    use 'sirver/ultisnips'

    use 'mxw/vim-jsx'
    use 'pangloss/vim-javascript'
    -- use 'leafgarland/typescript-vim'
    -- use 'peitalin/vim-jsx-typescript'
    -- use 'styled-components/vim-styled-components', { 'branch': 'main' }
    -- use 'jparise/vim-graphql'
    -- use 'othree/html5.vim'
    -- use 'RishabhRD/popfix'
    -- use 'RishabhRD/nvim-lsputils'

    -- use 'prettier/vim-prettier', { 'do': 'yarn install' }

    -- use 'yamatsum/nvim-cursorline'
    -- use 'APZelos/blamer.nvim'
    -- use 'machakann/vim-highlightedyank'

    -- use 'wfxr/minimap.vim'
    -- use 'plasticboy/vim-markdown'
    -- use 'tpope/vim-markdown'

    use 'kyazdani42/nvim-tree.lua'
    use 'nacro90/numb.nvim'
    -- use 'ray-x/aurora'
    -- use 'justinmk/vim-sneak'

    -- use 'vifm/vifm.vim'
    use 'w0ng/vim-hybrid'
    -- use 'easymotion/vim-easymotion'
    use 'phaazon/hop.nvim'

    -- use 'sonph/onehalf'

    -- use 'tpope/vim-sleuth'
    -- use 'tpope/vim-abolish'
    use 'tweekmonster/django-plus.vim'

    -- use 'adelarsq/vim-devicons-emoji'
    -- use 'abecodes/tabout.nvim'
    -- use 'liuchengxu/vim-which-key'
    use 'karb94/neoscroll.nvim'
    use 'mbbill/undotree'

    use 'Pocco81/TrueZen.nvim'
    use 'ibhagwan/fzf-lua'
    use 'vijaymarupudi/nvim-fzf'
    use 'kyazdani42/nvim-web-devicons'
    use 'simrat39/symbols-outline.nvim'


    use 'luochen1990/rainbow'
    -- use 'thiagoalessio/rainbow_levels.vim'
    -- use 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
    -- use 'rhysd/git-messenger.vim'
    -- use 'ctrlpvim/ctrlp.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'haishanh/night-owl.vim'
    -- use {
    --     "blackCauldron7/surround.nvim",
    --     config = function()
    --         require "surround".setup {}
    --     end
    -- }
    use 'sainnhe/everforest'
    -- use 'alexaandru/nvim-lspupdate'
    -- use 'michaelb/sniprun', {'do': 'bash install.sh'}

    use 'Pocco81/Catppuccino.nvim'
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use 'folke/lsp-colors.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use 'sainnhe/sonokai'
    use 'tamago324/lir.nvim'
    use {
        'rmagatti/session-lens',
        requires = {'rmagatti/auto-session'},
        config = function()
            require('session-lens').setup({--[[your custom config--]]})
        end
    }

    use {'akinsho/bufferline.nvim',}
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}
    use 'mihaifm/4colors'
end)
