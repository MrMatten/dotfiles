local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = {}
    },
    auto_install = true,
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
