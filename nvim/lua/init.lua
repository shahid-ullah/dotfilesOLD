require('plugins')
-- require('neoscroll').setup()
require('shahid.settings')
-- require('shahid.nvim-tree')
require('shahid.maps')
require('shahid.cmp_nvim')
require('shahid.lir')
require('shahid.telescope_lua')
require('shahid.custom_functions')
require('shahid.fzf-lua')
require('shahid.lspkind')
require('numb').setup()
require('github-theme').setup()
-- require'nvim-treesitter.configs'.setup {
--   autotag = {
--     enable = true,
--   }
-- }

-- require('specs').setup{
--     show_jumps  = true,
--     min_jump = 30,
--     popup = {
--         delay_ms = 0, -- delay before popup displays
--         inc_ms = 10, -- time increments used for fade/resize effects
--         blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
--         width = 10,
--         winhl = "PMenu",
--         fader = require('specs').linear_fader,
--         resizer = require('specs').shrink_resizer
--     },
--     ignore_filetypes = {},
--     ignore_buftypes = {
--         nofile = true,
--     },
-- }
-- require("nvim-tree.events").on_nvim_tree_ready(function()
--   vim.cmd("NvimTreeRefresh")
-- end)


local actions = require('telescope.actions')

-- Start: lsp-config
local nvim_lsp = require('lspconfig')
-- local coq = require "coq" -- add this

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space><space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright",  "pylsp", "tsserver", "bashls", "cssls", "denols", "html", "vimls", "denols",}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end


-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
-- for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup {
--         coq.lsp_ensure_capabilities()
--     }
-- end

-- End: lsp-config

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
