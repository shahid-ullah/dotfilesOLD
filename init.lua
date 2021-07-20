-- require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.denols.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.html.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}

local actions = require('telescope.actions')

require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}
-- require'lspconfig'.pyls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.denols.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/",
    })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
