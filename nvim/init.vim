""general configurations
"" set nocompatible              " required
"" filetype off                  " required
"" filetype plugin on
"let g:polyglot_disabled = ['autoindent']
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

lua require('init')

" Configurations: General\
" set path+=** "Find file in nested folder
set fillchars+=vert:\│

" Avoid showing message extra message when using completion
set shortmess+=c


" Configurations: Custom
nnoremap <silent> Q <nop>
set scrolloff=6
" imap kk <ESC>l
nnoremap <silent> <leader>hh :nohlsearch<CR>

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set undodir=~/.vim/undodir "Enable persistent undo so that undo history persists across vim sessions

"Enter to go to EOF and backspace to go to start
" nnoremap <CR> G
nnoremap <BS> gg

" copy and pasting from system clipboard
set clipboard+=unnamed
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
au BufNewFile,BufRead *.js,*.html,*.css,*vim
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

nnoremap <silent> <leader>cc :call QuickFix_toggle()<cr>


augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end


" Configurations: Plugin nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Configurations: Plugin fzf.vim
let g:fzf_tags_command = 'universal-ctags -R'
let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'}}
let $FZF_DEFAULT_OPTS = "--info=inline,"
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <silent> <Leader>fl :BLines<CR>
nmap <silent> <Leader>ll :Lines<CR>

" fzf File Finder
nmap <silent> <Leader>fg :GFiles<CR>
nmap <silent> <Leader>ff :Files<CR>

" fzf Buffer Finder
nmap <silent> <Leader>fb :Buffers<CR>
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
nnoremap <F5> :UndotreeToggle<CR>


"Configurations: Plugin ale
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
nnoremap <leader>a :Ack!<Space>


" Configuration: UltiSnippets


" Configuraions: Plugin tagbar
nmap <F8> :TagbarToggle<CR>


" Configurations: Plugin Black
autocmd BufWritePre *.py silent! execute ':Black'
let g:black_skip_string_normalization = 1
nnoremap <silent> <F9> :Black<CR>


" Configurations: plugin isort
autocmd BufWritePre *.py execute ':Isort'


" Configurations: Experiment

" practice with Learn vimscript the hard way
" inoremap <c-u> <esc>gUiwA


" Configuration: colorschemes
" general

" gruvbox specific
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set termguicolors
let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1


" onedark specific
let g:onedark_style = 'darker'
let g:onedark_transparent_background = 1
let g:onedark_termcolors=256
set background=dark
" colorscheme onedark
colorscheme moonfly
" colorscheme edge
" colorscheme catppuccino
" colorscheme nightfly

highlight cursorlinenr cterm=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray

"  Lsp Configuration
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
" nnoremap <C-f> :Telescope find_files<CR>
nnoremap <silent> <leader><leader>t :Telescope<CR>
nmap <silent> <leader>fd :lua require('init').search_dotfiles()<CR>
nmap <silent> <leader>fp :Telescope find_files cwd=/home/shahid/brainstorming/<CR>


" in init.vim

" command! Scratch lua require'tools'.makeScratch()

" Configuraions: vim-maximizer
nmap <silent> <leader>m :MaximizerToggle<CR>
" nmap <silent> <leader>m :TZMinimalist<CR>
nmap <silent> <leader>z :TZFocus<CR>
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
autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml set shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType htmldjango set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2


" Congigurations: numb.nvim
" lua require('numb').setup()


" imap jk <ESC>
" Configuraions: hop.nvim
nmap <leader><leader>w :HopWord<CR>
nmap <leader><leader>l :HopLine<CR>
nmap <leader>1 :HopChar1<CR>
nmap <leader>2 :HopChar2<CR>


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
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d


" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
"Moving Text
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==


" configurations: lspsaga
"
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>pd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>


" Map leader to which_key



" Configuraions: neoscroll

" lua require('neoscroll').setup()

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END


command! -nargs=0 RefreshBackground :lua require('shahid.custom_functions').RefreshBackground()
command! -nargs=0 HTMLFormatter :lua require('shahid.custom_functions').HTMLFormatter()

augroup MyColors
  autocmd!
  autocmd ColorScheme * :lua require('shahid.custom_functions').RefreshBackground()
augroup END


fun! EmptyRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    " call setreg(r, [])
    call setreg(r, @_)
  endfor
endfun

command! -nargs=0 EmptyRegisters call EmptyRegisters()


autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

autocmd ColorScheme * highlight StatusLine ctermbg=darkgray cterm=NONE guibg=darkgray gui=NONE

augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

com! W w

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-b': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Only show the cursor line in the active buffer.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Prevent x from overriding what's in the clipboard.
" noremap x "_x
" noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
" xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Insert mode navigate up and down
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>


" Better color support
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

nnoremap <silent> <esc> :noh<return><esc>

" Search and Replace
nnoremap <Leader>S :%s/\<<C-r><C-w>\>/

" nnoremap ; :
" nnoremap \ ;

command! -nargs=0 Ctags silent! !eval 'universal-ctags -R --exclude=.venv --exclude="*.html" -o newtags; mv newtags tags' &
nnoremap <silent> <leader>tu :Ctags<CR>
nnoremap <leader>F mzgg=G`z
nnoremap J mzJ`z
" Make Q repeat last macro
" nnoremap Q @@
" General {{{
augroup general_config
  autocmd!

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}
  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}
  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  " }}}
augroup end


" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif



" " Buffer prev/next
" nnoremap <C-x> :bnext<CR>
" nnoremap <C-z> :bprev<CR>

" Do not show stupid q: window
" map q: :q

" sometimes this happens and I hate it
" map :Vs :vs
" map :Sp :sp

" nnoremap j gj
" nnoremap k gk

" nnoremap <leader>F mzgg=G`z


" nnoremap <C-K> :call HighlightNearCursor()<CR>
" function HighlightNearCursor()
"   if !exists("s:highlightcursor")
"     match Todo /\k*\%#\k*/
"     let s:highlightcursor=1
"   else
"     match None
"     unlet s:highlightcursor
"   endif
" endfunction

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>



set sessionoptions+=options,resize,winpos,terminal
let g:auto_session_pre_save_cmds = ["tabdo NERDTreeClose"]
lua << EOF
require("bufferline").setup{}
EOF


" set time interval to 200 ms
let g:better_escape_interval = 300
" use jj to escape insert mode.
let g:better_escape_shortcut = 'kk'



" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_


" Find and replace (like Sublime Text 3)
" nnoremap <C-H> :%s/
" xnoremap <C-H> :s/

" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

" Break inserted text into smaller undo units.
for ch in [',', '.', '!', '?', ';', ':']
  execute printf('inoremap %s %s<C-g>u', ch, ch)
endfor
