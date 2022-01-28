-- Setup nvim-cmp.

local lspkind = require('lspkind')
lspkind.init()
local cmp = require'cmp'

cmp.setup({
        snippet = {
            expand = function(args)
                -- For `vsnip` user.
                -- vim.fn["vsnip#anonymous"](args.body)

                -- For `luasnip` user.
                -- require('luasnip').lsp_expand(args.body)

                -- For `ultisnips` user.
                vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
        },

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },

            -- For vsnip user.
            -- { name = 'vsnip' },

            -- For luasnip user.
            -- { name = 'luasnip' },

            -- For ultisnips user.
            { name = 'ultisnips' },
        },
        {
            { name = 'buffer' },
            { name = 'calc' },
        }),

        formatting = {
            format = lspkind.cmp_format(),
        },
    })
