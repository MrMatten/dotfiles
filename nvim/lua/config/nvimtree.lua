require('nvim-tree').setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        adaptive_size = true
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
})
