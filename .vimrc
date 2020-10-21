" general configurations
set nocompatible              " required
filetype off                  " required
filetype plugin on
set number
set relativenumber
set cursorline
syntax enable
set encoding=utf-8
set incsearch
set hlsearch
set path+=**
set wildmenu
set laststatus=2
set mouse=a
set title
" swap and backup file options
set noswapfile
set nobackup
set nowb
" set linebreak
set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undodir

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set colorcolumn=79

highlight BadWhitespace ctermbg=red guibg=darkred
" Highlight trailing whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" remove trailing whitespace automatically
autocmd BufWritePre * :%s/\s\+$//e
let python_highlight_all=1

"Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap . :normal.<CR>
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" stop preview window
set completeopt-=preview

let mapleader = ","
nnoremap \ ,
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" fzf configurations
nnoremap <leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
" nmap ; :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" Disable arrow keys
" start
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
"end

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'neoclide/coc.nvim'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'fisadev/vim-isort'
" Plugin 'klen/python-mode'
" Plugin 'webdevel/tabulous'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'vim-syntastic/syntastic'
Plugin 'tomtom/tcomment_vim'
" Plugin 'hdima/python-syntax'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'ErichDonGubler/vim-sublime-monokai'
" Plugin 'yggdroot/indentline'
Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
"  Plugin 'Valloric/YouCompleteMe'
"  Plugin 'tomasiser/vim-code-dark'
Plugin 'bling/vim-airline'

Plugin 'mileszs/ack.vim'
Plugin 'ggreer/the_silver_searcher'
let g:ackprg = 'ag --nogroup --nocolor --column'

Plugin 'simnalamburt/vim-mundo'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ryanoasis/vim-devicons'
Plugin 'sheerun/vim-polyglot'
" " All of your Plugins must be added before the following line
 call vundle#end()            " required

 filetype plugin indent on    " required
let g:airline_powerline_fonts = 1

"start of NERDTree configurations
" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen = 1
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" let g:NERDTreeIndicatorMapCustom = {
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


" To add the proper PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set fileformat=unix |
    \ set colorcolumn=79 |

"" For full stack developemnt
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |
    \ set colorcolumn=79 |

"Removing unnecessary whitespace
set background=dark
"set background=light
colorscheme solarized
" set t_Co=256


let pipenv_venv_path = system('pipenv --venv')
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python'
else
  let g:ycm_python_binary_path='/usr/bin/python3'
endif
nnoremap <silent> ,/ :nohlsearch<CR>

" snippet reading mapping
" autocmd BufNewFile base.html 0r ~/.vim/templates/base.html
" nnoremap ,im :-1read ~/.vim/templates/hacker<CR>
" nnoremap ,html :-1read ~/.vim/templates/base.html<CR>


" Provide list of buffers
nnoremap <leader>l :ls<CR>

" inoremap <esc> <nop>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" make . to work with visually selected lines
"highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"
" compiler pylint
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" hi CursorLine   cterm=NONE ctermbg=61 ctermfg=white guibg=darkred guifg=white

set tags=tags; " Look for a tags file recursively in
               " in parent directories
nnoremap <F5> :MundoToggle<CR>


"start
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
" end

let g:pymode_options_max_line_length = 120


" Documentation
" Plugin: ctags
" 1. install exuberant-ctags or universal-ctags
"   command: $ sudo apt install exuberant-ctags
" 2. Run $ ctags -R . (to create tags file for current folder and recursive folder
"
let vim_markdown_preview_github=1


" copy and pasting from system clipboard
set clipboard=unnamed
noremap <leader>y "+y
noremap <leader>p "+p
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
"scrollbind
set scb!

" Working with silver searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'
" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut "
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" bind K to grep word under cursor "
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind Tab and Shift-Tab to cycle through buffers "
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
