
set termguicolors " this variable must be enabled for colors to be applied properly
let g:python3_host_prog='/usr/bin/python3.8'
" general configurations

lua require('init')
let g:vimsyn_embed = 'l'

set fillchars+=vert:\|
" Configurations: General\

" Configurations: Custom
nnoremap <silent> Q <nop>

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set undodir=~/.vim/undodir
" Enable persistent undo so that undo history persists across vim sessions

" Backspace to go to start
nnoremap <BS> gg

"  copy and pasting from system clipboard
set clipboard+=unnamed
inoremap <C-v> <ESC>"+p<ESC>
" vnoremap <C-c> "+y
" vnoremap <C-d> "+d

" Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"remove trailing whitespace Before save
autocmd BufWritePre * :%s/\s\+$//e

" Move visual selection
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
" Border color
let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'}}
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

let $FZF_DEFAULT_OPTS = '--layout=reverse --bind ctrl-a:select-all --info=inline'


" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }


" nmap <silent> <Leader>fl :BLines<CR>
" nmap <silent> <Leader>ll :Lines<CR>

" fzf File Finder
nmap <silent> <Leader>fg :GFiles<CR>
" nmap <silent> <Leader>ff :Files<CR>

" fzf Buffer Finder
" nmap <silent> <Leader>fb :Buffers<CR>
nmap <silent> <Leader>fh :History<CR>

nmap <silent> <Leader>ft :BTags<CR>
nmap <silent> <leader>tt :Tags<CR>

if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ -w\ --nogroup\ --nocolor\ --column
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap <leader>g :Ag<SPACE>
endif

"Get Files
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
nnoremap <C-g> :Rg<CR>

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


" Configurations: Plugin vim-ariline-themes
let g:airline_theme='badwolf'
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


" Congigurations: Plugin undotree
"nnoremap <F5> :MundoToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>


"Configurations: Plugin ale
" install all required packages to global python version that vim was compiled with
" check compiled python version
" :py3 import sys; print(sys.version)

" Check Python files with flake8 and pylint.
" let g:ale_linters = {'python': [], 'javascript': []}
" let g:ale_fix_on_save = 1
" Fix Python files with black, autopep8 and isort.
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}
"
function TrimEndLines()
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * call TrimEndLines()


" Configurations: Ack.vim

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg -w --vimgrep --type-not sql --smart-case'
" let g:ackprg = 'ag -w --nogroup --nocolor --column'
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
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
" colorscheme dark_catppuccino
colorscheme monokai_pro
colorscheme srcery

" highlight cursorlinenr cterm=NONE
" highlight Normal guibg=NONE ctermbg=NONE
" highlight LineNr guibg=NONE ctermbg=NONE
" highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray

"  Lsp Configuration
imap <silent> <c-p> <Plug>(completion_trigger)
let g:completion_confirm_key = "\<C-y>"


" Configurations: Telescope
" nnoremap <C-f> :Telescope find_files<CR>
nnoremap <silent> <leader><leader>t :Telescope<CR>
nmap <silent> <leader>fd :lua require('init').search_dotfiles()<CR>
nmap <silent> <leader>ls :Telescope lsp_document_symbols<CR>
nmap <silent> <leader>lr :Telescope lsp_references<CR>
" nmap <silent> <leader>fp :Telescope find_files cwd=/home/shahid/brainstorming/<CR>


" in init.vim

" command! Scratch lua require'tools'.makeScratch()

" Configuraions: vim-maximizer
nmap <silent> <leader>z :MaximizerToggle<CR>
" nmap <silent> <leader>m :TZMinimalist<CR>
" nmap <silent> <leader>z :TZFocus<CR>
" nmap <silent> <leader>z <Plug>(zoom-toggle)


" Configuraions: nvim-compe
lua << EOF
--require'compe'.setup {
--enabled = true;
--autocomplete = true;
--debug = false;
--min_length = 1;
--preselect = 'enable';
--throttle_time = 80;
--source_timeout = 200;
--resolve_timeout = 800;
--incomplete_delay = 400;
--max_abbr_width = 100;
--max_kind_width = 100;
--max_menu_width = 100;
--documentation = true;
--
--source = {
--  path = true;
--  buffer = true;
--  calc = true;
--  nvim_lsp = true;
--  nvim_lua = true;
--  vsnip = true;
--  ultisnips = true;
--  luasnip = true;
--  };
--}
EOF

" Configuraions: Uncategorized

" HTML, XML, Jinja

autocmd FileType htmldjango set expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}

" Markdown and Journal
autocmd FileType markdown setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


" Congigurations: numb.nvim
" lua require('numb').setup()


imap jk <ESC>
" Configuraions: hop.nvim
nmap <leader><leader>w :HopWord<CR>
nmap <leader><leader>l :HopLine<CR>
nmap <leader>1 :HopChar1<CR>
nmap <leader>[ :HopChar1<CR>
nmap <leader>2 :HopChar2<CR>
nmap <leader>] :HopChar2<CR>


nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


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
" nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
nnoremap <silent> <A-d> :FloatermToggle<CR>
tnoremap <silent> <A-d> <C-\><C-n>:FloatermToggle<CR>

" Configuraions: Plugin neoscroll

" lua require('neoscroll').setup()

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END


command! -nargs=0 RefreshBackground :lua require('shahid.custom_functions').RefreshBackground()
command! -nargs=0 HTMLFormatter :lua require('shahid.custom_functions').HTMLFormatter()
command! -nargs=0 RemoveMarks :delm! | delm A-Z0-9

nnoremap <leader>rm :RemoveMarks<CR>

" augroup MyColors
"   autocmd!
" autocmd ColorScheme * :lua require('shahid.custom_functions').RefreshBackground()
" autocmd ColorScheme * highlight StatusLine ctermbg=darkgray cterm=NONE guibg=darkgray gui=NONE
" augroup END


fun! EmptyRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    " call setreg(r, [])
    call setreg(r, @_)
  endfor
endfun

command! -nargs=0 EmptyRegisters call EmptyRegisters()

augroup every
  autocmd!
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

com! W w


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
" nnoremap <c-s> :%s/\<<C-r><C-w>\>/

command! -nargs=0 Ctags silent! !eval 'universal-ctags -R --exclude=.venv --exclude="*.html" --exclude="*.css" --exclude="*.svg" --exclude="*.xml" -o newtags; mv newtags tags' &
nnoremap <silent> <leader>tu :Ctags<CR>

nnoremap <leader>F mzgg=G`z
nnoremap J mzJ`z
" Make Q repeat last macro
nnoremap Q @@
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
-- require("bufferline").setup{}
EOF

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_


" Find and replace (like Sublime Text 3)
nnoremap <C-s> :%s/\<\>//g
xnoremap <C-s> :s/

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

lua << EOF
function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end
EOF

nmap <Plug>TransposeCharacters xp :call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters


let $BASH_ENV = "/home/shahid/.bash_aliases"

" vim markdown development

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" vim-markdown configuration
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Limelight configuration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" imap jk <ESC>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db
nnoremap gp `[v`]
set ignorecase

" fzf lua configurations

nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
" nnoremap <leader>ff <cmd>lua require('fzf-lua').files()<CR>
nnoremap <leader>ff :Telescope find_files<CR>
" nnoremap <leader>fb <cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <leader>fb :Telescope buffers<CR>
" nnoremap <leader>fl <cmd>lua require('fzf-lua').blines()<CR>
nnoremap <leader>fl :Telescope current_buffer_fuzzy_find<CR>
" nnoremap <leader>fl <cmd>lua require('fzf-lua').grep_curbuf({fzf_layout='default'})<CR>
nnoremap <leader>ll <cmd>lua require('fzf-lua').lines()<CR>
nnoremap <leader>fm <cmd>lua require('fzf-lua').marks()<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


nnoremap j gj
nnoremap k gk


" nnoremap <M-K> <CMD>m .-2<CR>
" nnoremap <M-J> <CMD>m .+1<CR>
" nnoremap <M-H> <<
" nnoremap <M-L> >>
"

" Configuraions: Plugin gesture
set mouse=a

" nnoremap <silent> <LeftDrag> <Cmd>lua require("gesture").draw()<CR>
" nnoremap <silent> <LeftRelease> <Cmd>lua require("gesture").finish()<CR>

" or if you would like to use right click
" nnoremap <RightMouse> <Nop>
" nnoremap <silent> <RightDrag> <Cmd>lua require("gesture").draw()<CR>
" nnoremap <silent> <RightRelease> <Cmd>lua require("gesture").finish()<CR>

lua << EOF
--local gesture = require('gesture')
--gesture.register({
--name = "scroll to bottom",
--inputs = { gesture.up(), gesture.down() },
--action = "normal! G"
--})
--gesture.register({
--name = "next tab",
--inputs = { gesture.right() },
--action = "tabnext"
--})
--gesture.register({
--name = "previous tab",
--inputs = { gesture.left() },
--action = function(ctx) -- also can use callable
--vim.cmd("tabprevious")
--  end,
--  })
--gesture.register({
--name = "go back",
--inputs = { gesture.right(), gesture.left() },
---- map to `<C-o>` keycode
--action = [[lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", true)]]
--})
EOF
" Configurations End: Plugin gesture
"
"
"
" configurations: Plugin lir.nvim
nnoremap <silent> <leader>n :lua require('lir.float').toggle()<CR>
nnoremap <silent> <C-n> :lua require('lir.float').toggle()<CR>


" testing purpose

" inoremap <leader><leader>u <ESC>gUiwea<left>
"
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

let g:preview_markdown_parser ='glow'
let g:preview_markdown_auto_update='1'

set noignorecase
" Easily GREP current word in current file.
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>n :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue



hi! link QuickFixLine Search


" Bold stuff
let g:aqua_bold = 1

" To enable Lightmode change the style variable:
" options: "light", "dark"
let g:aquarium_style="dark"


map ' `
