" general configurations
set nocompatible              " required
filetype off                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'webdevel/tabulous'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

Plugin 'dense-analysis/ale'
" Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'google/yapf'

"Plugin 'neoclide/coc.nvim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'fisadev/vim-isort'

Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'


Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'

"Plugin 'klen/python-mode'
"Plugin 'webdevel/tabulous'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'hdima/python-syntax'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-commentary'
"Plugin 'godlygeek/tabular'

" Plugin 'altercation/vim-colors-solarized'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'ErichDonGubler/vim-sublime-monokai'
" Plugin 'tomasiser/vim-code-dark'
Plugin 'morhetz/gruvbox'
" autocmd vimenter * ++nested colorscheme gruvbox
"Plugin 'sheerun/vim-polyglot'

Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'


Plugin 'mileszs/ack.vim'
Plugin 'ggreer/the_silver_searcher'
" let g:ackprg = 'ag --nogroup --nocolor --column'

Plugin 'simnalamburt/vim-mundo'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'zhimsel/vim-stay'
Plugin 'ervandew/supertab'
"Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'bling/vim-airline'
call vundle#end()            " required

filetype plugin indent on    " required

" General settings
set number
set relativenumber

syntax enable
syntax on
set encoding=utf-8
set incsearch
set hlsearch
" Find file in nested folder
set path+=**
set wildmenu
set laststatus=2
"Enable mouse
set mouse=a
set title

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=79

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

" Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
" remove trailing whitespace automatically
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

"Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap . :normal.<CR>

" stop preview window
" set completeopt-=preview
autocmd FileType python setlocal foldmethod=manual
autocmd FileType python setlocal completeopt-=preview
set foldmethod=manual

let mapleader = ","
nnoremap \ ,
nnoremap <silent> <leader>, :nohlsearch<CR>
nnoremap <leader>w :w<CR>
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

let g:airline_powerline_fonts = 1
"start of NERDTree configurations
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


" To add the proper PEP 8 indentation
" au BufNewFile,BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set textwidth=79 |
"     \ set expandtab |
"     \ set fileformat=unix |
"     \ set colorcolumn=79 |

"" For full stack developemnt
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |
    \ set colorcolumn=90 |

set background=dark
" colorscheme solarized
" colorscheme sublimemonokai
" colorscheme codedark
" set termguicolors
" let g:gruvbox_termcolors=16
set t_Co=256
colorscheme gruvbox

" let g:airline_theme = 'codedark'
" let g:airline_theme = 'gruvbox'


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

" inoremap <esc> <nop>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Look for a tags file recursively in parent directories
set tags=tags;

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

" let g:pymode_options_max_line_length = 120

let vim_markdown_preview_github=1

" copy and pasting from system clipboard
set clipboard=unnamed
inoremap <C-v> <ESC>"+p<ESC>
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
"scrollbind
" set scb!

" Working with silver searcher
" let g:ackprg = 'ag --vimgrep--nogroup --nocolor --column'
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" bind Tab and Shift-Tab to cycle through buffers "
" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprevious<CR>

" For comment in django template
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}

" let g:indent_guides_enable_on_vim_startup = 1
let g:SimpylFold_fold_import = 0

set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.

nnoremap <leader>z zfip
vnoremap <leader>z zf
nnoremap <Space> za

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
set nowrap "Dont wrap lines
set confirm "Display an confirmation dialog when closing a unsaved file

nnoremap <F3> :source %<CR>

" fzf configurations

nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>

" File Finder
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>

" Buffer Finder
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

nmap <Leader>t :BTags<CR>
nmap <S-t> :Tags<CR>

"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <Esc><C-^>

autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

" colorscheme wombat256
" highlight Normal guibg=black guifg=white
" set background=dark
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-g> :Rg<CR>

let s:available_short_python = ':py3'
" Check Python files with flake8 and pylint.
" let g:ale_linters = {'python': ['flake8', 'pycodestyle']}
let g:ale_linters = {'python': ['pylint',]}
let g:ale_fix_on_save = 1
" Fix Python files with black, autopep8 and isort.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort'],
\}

let g:ale_echo_cursor=0

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" let g:fzf_buffers_jump = 1
"
"
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
nnoremap \ :Ack!<Space>
" }}}
