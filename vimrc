"general configurations
set nocompatible              " required
filetype off                  " required
filetype plugin on

set number
set relativenumber
nnoremap ; :
nnoremap \ ;

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'gruvbox-community/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()            " required
filetype plugin indent on    " required


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

set expandtab "convert tab to spaces"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=79,119

"swap and backup file options
set noswapfile
set nobackup
set nowb
set nowrap "Dont wrap lines
set linebreak

set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.

set hidden " helps to edit multiple buffers without saving
set confirm "Display an confirmation dialog when closing a unsaved file
set undofile


" Configuration: Custom
let mapleader = " "
nnoremap \ ,
nnoremap <silent> <leader>, :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

"Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undodir


" copy and pasting from system clipboard
set clipboard=unnamed
inoremap <C-v> <ESC>"+p<ESC>
vnoremap <leader>y "+y
vnoremap <C-d> "+d

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
""remove trailing whitespace automatically
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

" python PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set fileformat=unix |
    \ set colorcolumn=79 |
set cursorline

set tags=tags;

augroup AutoSaveFolds
    autocmd!
    " view files are about 500 bytes
    " bufleave but not bufwinleave captures closing 2nd tab
    " nested is needed by bufwrite* (if triggered via other autocmd)
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
augroup end

"cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


" Configuration: Plugin gruvbox
set background=dark
colorscheme gruvbox


" Configuration: Plugin nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Configuration: Plugin fzf.vim
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>

" fzf File Finder
nmap <Leader>f :Files<CR>

" fzf Buffer Finder
nmap <Leader>b :Buffers<CR>

nmap <Leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

let g:fzf_tags_command = 'universal-ctags -R'

if executable('ag')
    " Use ag over grep "
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    " set grepprg = 'rg --vimgrep --type-not sql --smart-case'

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache "
    let g:ctrlp_use_caching = 0

    " bind \ (backward slash) to grep shortcut "
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap <leader>/ :Ag<SPACE>
endif


command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\   <bang>0)
nnoremap <C-g> :Rg<CR>


" Configuration: Plugin vim-ariline-themes
let g:airline_theme='simple'


" setting collected from Navigating Vim and Tmux Splits (Christopher)
if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
          call system("tmux select-pane -" . a:tmuxdir)
          redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif

" Enable resize vim spilits inside tmux using mouse
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end


" Configuration coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
