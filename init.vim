set number
set relativenumber

"general configurations
set nocompatible              " required
filetype off                  " required
filetype plugin on
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
let pluginPath = stdpath('data') . '/plugged'
call plug#begin(pluginPath)
" Plug 'sheerun/vim-polyglot'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'savq/melange'

Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'scrooloose/nerdtree'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'


Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'raimondi/delimitmate'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-unimpaired'
" Plug 'neoclide/coc.nvim'
" Plugin 'kien/rainbow_parentheses.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'fisadev/vim-isort'
Plug 'psf/black'
Plug 'tweekmonster/django-plus.vim'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'
" Plug 'othree/html5.vim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'
"
Plug 'p00f/nvim-ts-rainbow'

Plug 'RRethy/vim-illuminate'
" Plug 'yamatsum/nvim-cursorline'
" Plug 'APZelos/blamer.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
call plug#end()


" Configuration: General
filetype plugin indent on    " required
set number
set relativenumber

syntax enable
syntax on
set encoding=utf-8
set incsearch
set hlsearch

set path+=** "Find file in nested folder
set wildmenu
set laststatus=2
set mouse=a "enable mouse"
set title
set cursorline

" When enabled, causes spaces to be used in place of tab character
set expandtab
" Specifies the width of a tab character (number of columns).
set tabstop=4
" When enabled, fine tunes the amount of whitespaces to be inserted.
set softtabstop=4
" Determines the amount of whitespace to insert or remove using the
" indentation commands in normal mode.
set shiftwidth=4
set colorcolumn=79,119

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


" Configuration: Custom
let mapleader = ","
nnoremap \ ,
nnoremap <silent> <leader>, :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undodir

"Enter to go to EOF and backspace to go to start
" nnoremap <CR> G
nnoremap <BS> gg

" copy and pasting from system clipboard
set clipboard=unnamed
inoremap <C-v> <ESC>"+p<ESC>
vnoremap <C-c> "+y
vnoremap <C-d> "+d

"Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
"remove trailing whitespace automatically
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
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
""" configuration for full stack developemnt
au BufNewFile,BufRead *.js,*.html,*.css
    \ set expandtab |
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |
    \ set colorcolumn=90 |

" Shortcuts for moving between tabs.
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>
"Look for a tags file recursively in parent directories
set tags=tags;

nnoremap <leader>z zfip
vnoremap <leader>z zf
nnoremap <Space> za

"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <Esc><C-^>
"nnoremap <F3> :source $HOME/.vimrc<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
"Delete inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
"Delete inside last parentheses
onoremap il( :<c-u>normal! F)vi(<cr>

"" snippet reading mapping
"" autocmd BufNewFile base.html 0r ~/.vim/templates/base.html
"" nnoremap ,im :-1read ~/.vim/templates/hacker<CR>
"" nnoremap ,html :-1read ~/.vim/templates/base.html<CR>
"" nnoremap ,scm :-1read ~/.vim/templates/scm<CR>
"" nnoremap ,ecm :-1read ~/.vim/templates/ecm<CR>
"nnoremap <leader>1 :-1read ~/.vim/templates/scm<CR>
"nnoremap <leader>2 :read ~/.vim/templates/ecm<CR>

augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end


" Configuration: Plugin nerdtree
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Configuration: Plugin fzf.vim
let g:fzf_tags_command = 'universal-ctags -R'
" Border color
let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'}}
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <Leader>l :BLines<CR>
" nmap <Leader>l :Telescope current_buffer_fuzzy_find<CR>
nmap <C-f> :Telescope live_grep<CR>
nmap <Leader>L :Lines<CR>

" fzf File Finder
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files!<CR>

" fzf Buffer Finder
nmap <Leader>b :Buffers!<CR>
nmap <Leader>h :History<CR>

nmap <Leader>t :BTags<CR>
nmap <S-t> :Tags<CR>

if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0
  " bind <leader>/ (forward slash) to grep shortcut "
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap <leader>/ :Ag<SPACE>
endif


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-g> :Rg!<CR>

" command! -bang -nargs=* Blines call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview(), <bang>0)

" fzf experimental
" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" nnoremap <C-g> :RG<CR>


" Configuration: Plugin vim-ariline-themes
let g:airline_theme='simple'


"Configuration: Plugin nerdtree-git-plugin
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


"" plugin vim-mundo configuration
"nnoremap <F5> :MundoToggle<CR>


" For comment in django template
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}


" Configuration: Plugin ale
" install all required packages to global python version that vim was compiled with
" check compiled python version
" :py3 import sys; print(sys.version)

" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': []}
let g:ale_fix_on_save = 1
" Fix Python files with black, autopep8 and isort.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}


" Configuration: Ack.vim

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
" let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
" let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <leader>a :Ack!<Space>


" Configuration: UltiSnippets


" Configuraion: Plugin tagbar
nmap <F8> :TagbarToggle<CR>


" Configuration: Plugin Black
" autocmd BufWritePre *.py execute ':Black'
let g:black_skip_string_normalization = 1
nnoremap <F9> :Black<CR>


" Configuration: plugin isort
autocmd BufWritePre *.py execute ':Isort'


" Configuration: Experiment

" practice with Learn vimscript the hard way
inoremap <c-u> <esc>gUiwA
nnoremap <tab> %
vnoremap <tab> %


" Configuration: Plugin gruvbox
set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
set background=dark

highlight Normal guibg=none
highlight cursorlinenr cterm=NONE

set completeopt=menuone,noinsert,noselect

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
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
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" Avoid showing message extra message when using completion
set shortmess+=c
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" let g:completion_enable_snippet = 'UltiSnips'
"
" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" let g:completion_confirm_key = "\<C-y>"

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
    prompt_position = "top",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

noremap <silent> <C-up> :resize +2<CR>
noremap <silent> <C-down> :resize -2<CR>
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>

lua require('init')
" in init.vim

command! Scratch lua require'tools'.makeScratch()

lua << EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
EOF
