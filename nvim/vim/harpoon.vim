nnoremap <C-y> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-p> :lua require('telescope').extensions.harpoon.marks{}<CR>
nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
