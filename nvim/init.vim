let g:python3_host_prog='/usr/bin/python3.8'
" general configurations

lua require('init')
let g:vimsyn_embed = 'l' "Enable lua code hightlight in vim script

" configuration: colorschemes
set termguicolors " this variable must be enabled for colors to be applied properly

"configuration: colorscheme gruvbox
" gruvbox specific
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" configuration: colorschme -> neosolarized
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1

let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_termBoldAsBright = 1

" configuration: colorschme -> vim-hybrid-material
"
let g:enable_bold_font = 1
let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
"
" Configuraion: vim-hybrid-material
let g:enable_bold_font = 1
let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
colorscheme hybrid_material


" Configuraion: kaicataldo/material.vim
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
" let g:material_theme_style = 'palenight-community'
" let g:material_terminal_italics = 1
" colorscheme material


set fillchars+=vert:\|

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

nnoremap <silent><leader><leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader><leader>sv :source $MYVIMRC<cr>

" Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undodir

"  copy and pasting from system clipboard
set clipboard+=unnamed
inoremap <C-v> <ESC>"+p<ESC>

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
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

set tags=tags; "Look for a tags file recursively in parent directories

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


" congiguration: Plugin nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" configurations: Plugin fzf.vim

let g:fzf_tags_command = 'ctags -R'
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

nmap <silent> <Leader>t :BTags<CR>
nmap <silent> <leader>T :Tags<CR>

" if executable('ag')
"   " Use ag over grep "
"   set grepprg=ag\ -w\ --nogroup\ --nocolor\ --column
"   command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"   nnoremap <leader>g :Ag<SPACE>
" endif

" Get text in files with Rg
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
nnoremap <C-g> :Rg<CR>


" congiguration: Plugin vim-ariline-themes
let g:airline_theme='simple'


"congiguration: Plugin nerdtree-git-plugin
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
nnoremap <F5> :UndotreeToggle<CR>


"congiguration: Plugin ale
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


" congiguration: Ack.vim

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
" Any empty ack search will search for the word the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>a so we're ready to type the search keyword
nnoremap <leader>a :Ack!<Space>


" Configuraions: Plugin tagbar
nmap <F8> :TagbarToggle<CR>

" congiguration: Plugin Black
let g:black_skip_string_normalization = 1

augroup black
  autocmd!
  autocmd BufWritePre *.py silent! execute ':Black'
augroup end

nnoremap <silent> <F9> :Black<CR>

" congiguration: plugin isort
augroup isort
  autocmd!
  autocmd BufWritePre *.py execute ':Isort'
augroup end

"  Lsp Configuration
imap <silent> <c-p> <Plug>(completion_trigger)
let g:completion_confirm_key = "\<C-y>"


" congiguration: Telescope
nmap <silent> <leader>vs :Telescope lsp_document_symbols<CR>
nmap <silent> <leader>vr :Telescope lsp_references<CR>
" nmap <silent> <leader>fp :Telescope find_files cwd=/home/shahid/brainstorming/<CR>


" Configuraions: vim-maximizer
nmap <silent> <leader>z :MaximizerToggle<CR>

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


" Configuraions: hop.nvim
nmap <silent> <leader>w :HopWord<CR>
nmap <silent> <leader>s :HopChar2<CR>


nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

inoremap <C-v> <ESC>"+p<ESC>
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

" configurations: lspsaga
"
" nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" " nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" nnoremap <silent> <leader>pd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" " nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
nnoremap <silent> <A-d> :FloatermToggle<CR>
tnoremap <silent> <A-d> <C-\><C-n>:FloatermToggle<CR>


augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END


command! -nargs=0 RefreshBackground :lua require('shahid.custom_functions').RefreshBackground()
command! -nargs=0 HTMLFormatter :lua require('shahid.custom_functions').HTMLFormatter()
command! -nargs=0 RemoveMarks :delm! | delm A-Z0-9

nnoremap <leader>rm :RemoveMarks<CR>


fun! EmptyRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
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

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste


" Prevent selecting and pasting from overwriting what you originally copied.
" xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Insert mode navigate up and down
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap <silent> <esc> :noh<return><esc>

" Search and Replace
nnoremap <Leader><leader>ss :%s/\<<C-r><C-w>\>/

nnoremap <leader>F mzgg=G`z
nnoremap J mzJ`z
" Make Q repeat last macro
nnoremap Q @@
" General {{{


" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

nnoremap <leader>xx <cmd>TroubleToggle<cr>
" nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
" nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
" nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
" nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
" nnoremap gR <cmd>TroubleToggle lsp_references<cr>


set sessionoptions+=options,resize,winpos,terminal
let g:auto_session_pre_save_cmds = ["tabdo NERDTreeClose"]

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_


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

" nmap <Plug>TransposeCharacters xp :call repeat#set("\<Plug>TransposeCharacters")<CR>
" nmap cp <Plug>TransposeCharacters


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

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

nnoremap gp `[v`]

" fzf lua configurations

nnoremap <silent> <c-P> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <silent> <leader>f :Telescope find_files<CR>
nnoremap <silent> <leader>b :Telescope buffers<CR>
nnoremap <silent> <leader>l :Telescope current_buffer_fuzzy_find<CR>


nnoremap j gj
nnoremap k gk


" configurations: Plugin lir.nvim
nnoremap <silent> <leader>n :lua require('lir.float').toggle()<CR>
" nnoremap <silent> <C-n> :lua require('lir.float').toggle()<CR>


let g:preview_markdown_parser ='glow'
let g:preview_markdown_auto_update='1'

set noignorecase
" Easily GREP current word in current file.
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc


hi! link QuickFixLine Search

map ' `

" nnoremap <leader>vpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
" nnoremap <leader>vpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
" nnoremap <leader>vpc <cmd>lua require('goto-preview').close_all_win()<CR>
" Only set if you have telescope installed
" nnoremap <leader>vpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>vll :call LspLocationList()<CR>

" configuration: harpoon

nnoremap <C-y> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-p> :lua require('telescope').extensions.harpoon.marks{}<CR>
nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>


" configuration: plugin -> 'kevinhwang91/nvim-hlslens'

noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

nnoremap <leader>R :set wrap!<CR>
