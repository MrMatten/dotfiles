local wk = require("which-key")

local opts = {
    mode = "n",
    prefix = "<leader>"
}

local v_opts = {
    mode = "v",
    prefix = "<leader>"
}

local keys_visual = {
    z = {
        name = "System",
        c = { "\"*y", "Copy to clipboard" },
    },
}

local keys_normal = {
    g = {
        name = "Code information",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Get Definition" },
        D = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics" },
        h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    },

    c = {
        name = "Code manipulation",
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" }
    },

    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "File" },
        h = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
        w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
        t = { "<cmd>NvimTreeFindFileToggle<cr>", "Toggle Tree" },
    },

    s = {
        name = "Split",
        v = { "<cmd>vs %<cr>", "Vertical" },
        h = { "<cmd>split %<cr>", "Horizontal" },
    },

    t = {
        name = "Tabs",
        n = { "<cmd>tabnew <cr>", "New" },
        l = { "<cmd>tabprevious <cr>", "Left" },
        r = { "<cmd>tabNext <cr>", "Right" },
    },

    n = {
        name = "Neotest",
        a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
        f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
        F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
        l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
        L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
        n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
        N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
        o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
        S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
        s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },
}

wk.register(keys_normal, opts)
wk.register(keys_visual, v_opts)

wk.register({
    ["<C-h>"] = { "<C-w>h", "Left tab" },
    ["<C-j>"] = { "<C-w>j", "Down tab" },
    ["<C-k>"] = { "<C-w>k", "Up tab" },
    ["<C-l>"] = { "<C-w>l", "Right tab" },
    ["<leader><Tab>"] = { "<C-w>w", "Next tab" },
})

wk.setup {}
