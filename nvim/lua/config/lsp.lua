require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"gopls", "tsserver", "tailwindcss", "sumneko_lua"}
})

local lspconfig = require 'lspconfig'

local function on_attach(client, bufnr)
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

local flags = {
    debounce_text_changes = 150,
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    flags = flags
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = flags
}

lspconfig.tailwindcss.setup {}

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
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
