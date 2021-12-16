
set termguicolors " this variable must be enabled for colors to be applied properly
let g:vimsyn_embed = 'l' "Enable lua code hightlight in vim script

"configuration: colorscheme gruvbox
" gruvbox specific
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


set fillchars+=vert:\|

set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

" Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undodir

"  copy and pasting from system clipboard
set clipboard+=unnamed

set tags=tags; "Look for a tags file recursively in parent directories
