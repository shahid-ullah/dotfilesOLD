"general configurations
set nocompatible              " required
filetype off                  " required
filetype plugin on
let g:polyglot_disabled = ['autoindent']
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" - Avoid using standard Vim directory names like 'plugin'
let pluginPath = stdpath('data') . '/plugged'
call plug#begin(pluginPath)

Plug 'sheerun/vim-polyglot'
Plug 'raimon49/requirements.txt.vim'

" colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'

Plug 'navarasu/onedark.nvim'
" Plug 'savq/melange'
Plug 'gruvbox-community/gruvbox'
" Plug 'wojciechkepka/bogster'
Plug 'arzg/vim-colors-xcode'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'

Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" Plug 'dyng/ctrlsf.vim'


Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ThePrimeagen/harpoon'

" Plug 'airblade/vim-rooter'
" Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'w0rp/ale'
" Plug 'neoclide/coc.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'scrooloose/nerdtree'
" Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
" Plugin 'kien/rainbow_parentheses.vim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'RRethy/vim-illuminate'

Plug 'tpope/vim-scriptease'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector'
" Plug 'dhruvasagar/vim-zoom'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" django development Plugin
Plug 'jmcantrell/vim-virtualenv'
Plug 'fisadev/vim-isort'
Plug 'psf/black'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

" Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'
" Plug 'othree/html5.vim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Plug 'yamatsum/nvim-cursorline'
" Plug 'APZelos/blamer.nvim'
" Plug 'machakann/vim-highlightedyank'

" Plug 'wfxr/minimap.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-markdown'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'nacro90/numb.nvim'
Plug 'ray-x/aurora'
" Plug 'justinmk/vim-sneak'

" Plug 'vifm/vifm.vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'easymotion/vim-easymotion'
Plug 'phaazon/hop.nvim'

" Plug 'sonph/onehalf'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-abolish'
Plug 'tweekmonster/django-plus.vim'

" Plug 'adelarsq/vim-devicons-emoji'
Plug 'abecodes/tabout.nvim'

call plug#end()


" Configurations: General
filetype plugin indent on    " required
set number
set relativenumber
" set tm=500
syntax enable
syntax on
set encoding=utf-8
set ignorecase
set incsearch
set hlsearch
set smartcase

set path+=** "Find file in nested folder
set wildmode=longest,list,full
set wildmenu
set laststatus=2
set mouse=a "enable mouse"
set title
set cursorline

set expandtab " When enabled, causes spaces to be used in place of tab character
set tabstop=4 " Specifies the width of a tab character (number of columns).
set softtabstop=4 " When enabled, fine tunes the amount of whitespaces to be inserted.
                  " Determines the amount of whitespace to insert or remove using the
set smarttab
set shiftwidth=4 " indentation commands in normal mode.
set colorcolumn=79,119
set showcmd
set showmode

"swap and backup file options
set noswapfile
set nobackup
set nowritebackup
set nowrap "Dont wrap lines
set linebreak

set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.

set hidden " helps to edit multiple buffers without saving
set confirm "Display an confirmation dialog when closing a unsaved file
set undofile

set splitright
set splitbelow
set fillchars+=vert:\│

set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c


" Configurations: Custom
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <silent> Q <nop>
set scrolloff=6
imap ii <ESC>
nnoremap <silent> <leader>hh :nohlsearch<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set undodir=~/.vim/undodir "Enable persistent undo so that undo history persists across vim sessions

"Enter to go to EOF and backspace to go to start
" nnoremap <CR> G
nnoremap <BS> gg

" copy and pasting from system clipboard
set clipboard=unnamed
inoremap <C-v> <ESC>"+p<ESC>
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ "remove trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e

"Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap . :normal.<CR>

" Disable arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

noremap <silent> <C-up> :resize +2<CR>
noremap <silent> <C-down> :resize -2<CR>
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>

""" configuration for full stack developemnt
au BufNewFile,BufRead *.js,*.html,*.css
    \ set expandtab |
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |
    \ set colorcolumn=90 |

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

"Look for a tags file recursively in parent directories
set tags=tags;

" inoremap <C-b> <Esc><C-^>
"Delete inside next parentheses
" onoremap in( :<c-u>normal! f(vi(<cr>
"Delete inside last parentheses
" onoremap il( :<c-u>normal! F)vi(<cr>

" Toggle quickfix list
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

nnoremap <silent> <leader>c :call QuickFix_toggle()<cr>


augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end


" Configurations: Plugin nerdtree
map <silent> <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Configurations: Plugin fzf.vim
let g:fzf_tags_command = 'universal-ctags -R'
let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'}}
let $FZF_DEFAULT_OPTS = "--info=inline"
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <silent> <Leader>fl :BLines<CR>
nmap <silent> <Leader>ll :Lines<CR>

" fzf File Finder
nmap <silent> <Leader>fg :GFiles<CR>
nmap <silent> <Leader>ff :Files!<CR>

" fzf Buffer Finder
nmap <silent> <Leader>fb :Buffers!<CR>
nmap <silent> <Leader>fh :History<CR>

nmap <silent> <Leader>ft :BTags<CR>
nmap <silent> <leader>tt :Tags<CR>

if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ -w\ --nogroup\ --nocolor\ --column
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap <leader>g :Ag<SPACE>
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --bind ctrl-a:select-all,ctrl-d:deselect-all'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --bind ctrl-a:select-all,ctrl-d:deselect-all'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-g> :Rg!<CR>


" Configurations: Plugin vim-ariline-themes
let g:airline_theme='simple'
" let g:airline_statusline_ontop=1
" let g:airline#extensions#tabline#enabled = 1


"Configurations: Plugin nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeGitStatusShowIgnored= 1


" Congigurations: vim-mundo
"nnoremap <F5> :MundoToggle<CR>


" Configurations: Plugin ale
" install all required packages to global python version that vim was compiled with
" check compiled python version
" :py3 import sys; print(sys.version)

" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': [], 'javascript': []}
let g:ale_fix_on_save = 1
" Fix Python files with black, autopep8 and isort.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}


" Configurations: Ack.vim

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg -w --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
" let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>a so we're ready to type the search keyword
nnoremap <silent> <leader>a :Ack!<Space>


" Configuration: UltiSnippets


" Configuraions: Plugin tagbar
nmap <F8> :TagbarToggle<CR>


" Configurations: Plugin Black
" autocmd BufWritePre *.py execute ':Black'
let g:black_skip_string_normalization = 1
nnoremap <silent> <F9> :Black<CR>


" Configurations: plugin isort
autocmd BufWritePre *.py execute ':Isort'


" Configurations: Experiment

" practice with Learn vimscript the hard way
" inoremap <c-u> <esc>gUiwA


" Configuration: colorschemes
" general
set termguicolors
highlight cursorlinenr cterm=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray

" gruvbox specific
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1


" onedark specific
let g:onedark_style = 'darker'
let g:onedark_transparent_background = 1
let g:onedark_termcolors=256
set background=dark
colorscheme onedark



" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
imap <silent> <c-p> <Plug>(completion_trigger)
let g:completion_confirm_key = "\<C-y>"


" Configurations: Telescope
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config= {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
        i = {
            ["<C-x>"] = false,
            ["<C-q>"] = require('telescope.actions').send_to_qflist,
        },
    }
  },
  extensions = {
        fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('coc')
EOF
" nmap <C-p> :Telescope find_files<CR>
nnoremap <silent> <leader>t :Telescope<CR>
nmap <silent> <leader>fd :lua require('init').search_dotfiles()<CR>
nmap <silent> <leader>fp :Telescope find_files cwd=/home/shahid/brainstorming/<CR>


lua require('init')
" in init.vim

" command! Scratch lua require'tools'.makeScratch()


" Configurations: nvim-ts-rainbow
lua << EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
EOF


" Configuraions: vim-maximizer
nmap <silent> <leader>z :MaximizerToggle<CR>
" nmap <silent> <leader>z <Plug>(zoom-toggle)


" Configuraions: nvim-compe
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
EOF

" Configuraions: Uncategorized

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2


" Congigurations: numb.nvim
lua require('numb').setup()


" imap jk <ESC>
" Configuraions: hop.nvim
nmap <leader><leader>w :HopWord<CR>
nmap <leader><leader>l :HopLine<CR>
nmap <leader><leader>f :HopChar1<CR>
nmap <leader><leader>s :HopChar2<CR>


nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoint
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap " " " "<c-g>u


" greatest remap ever
" vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" nnoremap <leader>d "_d
" vnoremap <leader>d "_d


" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
"Moving Text
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
