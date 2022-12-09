local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    auto_install = true,
}
