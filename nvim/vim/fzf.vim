let g:fzf_tags_command = 'ctags -R'
" let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'}}
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
" let $FZF_DEFAULT_OPTS = '--layout=reverse --bind ctrl-a:select-all --info=inline'

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
"       \ { 'fg':      ['fg', 'Normal'],
"       \ 'bg':      ['bg', 'Normal'],
"       \ 'hl':      ['fg', 'Comment'],
"       \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"       \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"       \ 'hl+':     ['fg', 'Statement'],
"       \ 'info':    ['fg', 'PreProc'],
"       \ 'border':  ['fg', 'Ignore'],
"       \ 'prompt':  ['fg', 'Conditional'],
"       \ 'pointer': ['fg', 'Exception'],
"       \ 'marker':  ['fg', 'Keyword'],
"       \ 'spinner': ['fg', 'Label'],
"       \ 'header':  ['fg', 'Comment'] }

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
