require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "gopls", "tsserver", "tailwindcss", "sumneko_lua" }
})

-- Settings
local lspconfig = require 'lspconfig'

local function autoSaveOnAttach(client, bufnr)
    -- Use LSP as the handler for formatexpr.
    -- See `:help formatexpr` for more information.
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
        })
    end
end

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local flags = {
    debounce_text_changes = 150,
}

-- Language servers
lspconfig.gopls.setup {
    on_attach = autoSaveOnAttach,
    flags = flags
}

lspconfig.tsserver.setup {
    on_attach = autoSaveOnAttach,
    filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
    flags = flags
}

lspconfig.tailwindcss.setup {
    on_attach = autoSaveOnAttach,
    flags = flags
}

require'lspconfig'.lemminx.setup{
    on_attach = autoSaveOnAttach,
    flags = flags
}

lspconfig.sumneko_lua.setup {
    on_attach = autoSaveOnAttach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    },
    flags = flags
}

local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup {
    on_attach = autoSaveOnAttach,
    filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
    sources = {
        null_ls.builtins.formatting.prettierd
    }
}

-- Style hover window
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

-- Open diagnostics in floating window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
