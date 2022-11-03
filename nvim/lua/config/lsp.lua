-- Setup autocomplete lsp 
vim.opt.completeopt='menu,menuone,noselect,noinsert'

-- Setup nvim-cmp.
local cmp = require('cmp')
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    autoselect = false,
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-x>'] = cmp.mapping.complete(),
        ['<C-space>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,        
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip'},
        { name = 'buffer', keywork_length = 5 },
        { name = 'npm', keywork_length = 4 },
    }
})

require'lspconfig'.gopls.setup {}
require'lspconfig'.pylsp.setup {}

local util = require "lspconfig/util"
require'lspconfig'.tsserver.setup { 
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json")
}

-- williamboman/nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
    server:setup(opts)
end)

-- javascript
-- npm install -g diagnostic-languageserver eslint_d prettier_d_slim prettier
local function on_attach(client)
  print('Attached to ' .. client.name)
end
local dlsconfig = require 'diagnosticls-configs'
dlsconfig.init {
  default_config = false,
  format = true,
  on_attach = on_attach,
}
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'
prettier.requiredFiles = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
  }
dlsconfig.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = { prettier }
  },
  ['javascriptreact'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['css'] = {
    formatter = prettier
  },
  ['html'] = {
    formatter = prettier
  },
}




