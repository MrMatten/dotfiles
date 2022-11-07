local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
    ["null-ls"] = {
        condition = function()
            return prettier.config_exists({
                -- if `false`, skips checking `package.json` for `"prettier"` key
                check_package_json = true,
            })
        end,
    },
    bin = 'prettierd',
    filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less"
    },
    cli_options = {
        config_precedence = "prefer-file",
    },
}
