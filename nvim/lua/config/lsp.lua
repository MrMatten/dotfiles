require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "sumneko_lua",
    "tsserver",
    "cssls",
    "dockerls",
    "graphql",
    "tailwindcss"
  },

  automatic_installation = true
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
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  flags = flags
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  flags = flags
}

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
