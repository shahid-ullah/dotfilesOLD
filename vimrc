" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"general configurations
set nocompatible              " required
filetype off                  " required
filetype plugin on
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

"Django HTML
Plug 'tweekmonster/django-plus.vim'

"Track the engine.
Plug 'sirver/ultisnips'

"Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Provides insert mode autocompletion for quotes, brackets, etc
Plug 'raimondi/delimitmate'

" setting the tabline including tab page levels
Plug 'webdevel/tabulous'

" Enable repeating supporting plugin maps with "."
Plug 'tpope/vim-repeat'

" Pairs of handly bracket mappings
Plug 'tpope/vim-unimpaired'

" Display tags in windows ordered by scope
Plug 'majutsushi/tagbar'

" check syntax asynchronously and fix files with Language Server Protocol (LSP)
Plug 'dense-analysis/ale'

"Plugin 'Valloric/YouCompleteMe'
" Plug 'davidhalter/jedi-vim'

" Intellisense engine for vim8 and neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Shows git diff markers in the sign column and stages/previews/undoes hunks and partial
Plug 'airblade/vim-gitgutter'

" plugin to display the indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" Work with python virtualenvs
Plug 'jmcantrell/vim-virtualenv'

" sort python imports
Plug 'fisadev/vim-isort'

" Tree explorer
Plug 'preservim/nerdtree'

" NERDTree showing git status
Plug 'xuyuanp/nerdtree-git-plugin'

" vim markdown runtime files
Plug 'tpope/vim-markdown'

" Markdown vim mode
" Plug 'plasticboy/vim-markdown'

" Previewing markdown files in a browser
" Plug 'JamshedVesuna/vim-markdown-preview'

" Instant markdown previews for vim
" Plug 'suan/vim-instant-markdown'

" Python code folding for vim
Plug 'tmhedberg/simpylfold'

" comment stuf out
Plug 'tpope/vim-commentary'

" Add filetype icons to vim plugins
Plug 'ryanoasis/vim-devicons'

" colorscheme for vim
Plug 'morhetz/gruvbox'

" A command line fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Search tool for vim
Plug 'mileszs/ack.vim'

" Code searching tool
Plug 'ggreer/the_silver_searcher'


" vim undo tree visualizer
Plug 'simnalamburt/vim-mundo'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" A light and configurable statusline/tabline plugin for vim
Plug 'itchyny/lightline.vim'


"Plugin 'klen/python-mode'
"Plugin 'webdevel/tabulous'
"Plugin 'zhimsel/vim-stay'
"Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'hdima/python-syntax'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'tomtom/tcomment_vim'
"Plugin 'ErichDonGubler/vim-sublime-monokai'
"Plugin 'tomasiser/vim-code-dark'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'godlygeek/tabular'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

"General settings
set number
set relativenumber

syntax enable
syntax on
set encoding=utf-8
set incsearch
" set nohlsearch
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
set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

"Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undodir

"Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
"remove trailing whitespace automatically
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

"Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap . :normal.<CR>

"stop preview window
"set completeopt-=preview
autocmd FileType python setlocal completeopt-=preview
" set foldmethod=manual
"autocmd FileType python setlocal foldmethod=manual
autocmd BufRead,BufNewFile python set colorcolumn=79,119


let mapleader = ","
nnoremap \ ,
nnoremap <silent> <leader>, :nohlsearch<CR>
nnoremap <leader>w :up<CR>
nnoremap <leader>q :q<CR>

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

" NERDTree configurations
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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

" python PEP 8 indentation
" au BufNewFile,BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set textwidth=79 |
"     \ set expandtab |
"     \ set fileformat=unix |
"     \ set colorcolumn=79 |

"" configuration for full stack developemnt
au BufNewFile,BufRead *.js,*.html,*.css
    \ set expandtab |
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |
    \ set colorcolumn=90 |

set background=dark
" set t_Co=256
colorscheme gruvbox

" configuring pipenv virtual environment path for YoucomepleteMe
let pipenv_venv_path = system('pipenv --venv')
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python'
else
  let g:ycm_python_binary_path='/usr/bin/python3'
endif

" snippet reading mapping
" autocmd BufNewFile base.html 0r ~/.vim/templates/base.html
" nnoremap ,im :-1read ~/.vim/templates/hacker<CR>
" nnoremap ,html :-1read ~/.vim/templates/base.html<CR>
" nnoremap ,scm :-1read ~/.vim/templates/scm<CR>
" nnoremap ,ecm :-1read ~/.vim/templates/ecm<CR>
nnoremap <leader>1 :-1read ~/.vim/templates/scm<CR>
nnoremap <leader>2 :read ~/.vim/templates/ecm<CR>

"inoremap <esc> <nop>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"Look for a tags file recursively in parent directories
set tags=tags;

" plugin vim-mundo configuration
nnoremap <F5> :MundoToggle<CR>

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


let vim_markdown_preview_github=1

" copy and pasting from system clipboard
set clipboard=unnamed
inoremap <C-v> <ESC>"+p<ESC>
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

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

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" For comment in django template
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}

" plugin simpylfold configurations
let g:SimpylFold_fold_import = 0

nnoremap <leader>z zfip
vnoremap <leader>z zf
nnoremap <Space> za

set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.

augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" set completeopt=longest,menuone
set cursorline
" Highlight corsorline
" highlight CursorLine guibg=lightblue ctermbg=lightgrey

highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" testing with new settings
" set hidden " helps to edit multiple buffers without saving
" set showcmd
" set ruler
set confirm "Display an confirmation dialog when closing a unsaved file


" fzf configurations
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>

" fzf File Finder
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>

" fzf Buffer Finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

nmap <Leader>t :BTags<CR>
nmap <S-t> :Tags<CR>

"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <Esc><C-^>

autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-g> :Rg<CR>

" plugin ale configuration
" install all required packages to global python version that vim was compiled with
" check compiled python version
" :py3 import sys; print(sys.version)

let s:available_short_python = ':py3'
" Check Python files with flake8 and pylint.
" let g:ale_linters = {'python': ['flake8', 'pycodestyle']}
let g:ale_fix_on_save = 1
let g:ale_linters = {'python': ['pylint', 'flake8']}
" Fix Python files with black, autopep8 and isort.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black',],
\}


" plugin fzf configuration
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'universal-ctags -R'
" set grepformat=''

set grepformat=%f:%l:%c:%m

" ack.vim --- {{{
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
nnoremap <leader>\ :Ack!<Space>
" }}}

" assuming you want to use snipmate snippet engine
" ActivateAddons vim-snippets snipmate

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" practice with Learn vimscript the hard way
" inoremap <c-d> <esc>ddO
" inoremap <c-u> <esc>gUiwA

nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>
nnoremap <leader>sv :source $HOME/.vimrc<cr>
nnoremap <F3> :source $HOME/.vimrc<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" nnoremap H ^
" nnoremap L $
"Delete inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
"Delete inside last parentheses
onoremap il( :<c-u>normal! F)vi(<cr>
inoremap <c-p> <esc>gUiwA<space>


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

" plugin tagbar configurations
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>v :execute "rightbelow vsplit " . bufname("#")<CR>
" nnoremap <leader>s :execute "rightbelow split " . bufname("#")<CR>
