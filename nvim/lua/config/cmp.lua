-- Setup autocomplete lsp
vim.opt.completeopt = 'menu,menuone,noselect'

-- Setup nvim-cmp.
local status, cmp = pcall(require, "cmp")
if (not status) then return end

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    window = {
        documentation = cmp.config.window.bordered()
    },

    mapping = {
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.select_next_item(select_opts),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(select_opts)
    },

    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keywork_length = 2 },
        { name = 'buffer', keywork_length = 5 },
        { name = 'luasnip' },
        { name = 'treesitter' },
        { name = 'npm', keywork_length = 4 },
    }
})
