local wk = require("which-key")

wk.register({
  z = {
    name = "System",
    c = { "*y", "Copy to clipboard" },
  },

  g = {
    name = "Code",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Get Definition"},
    D = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
  },

  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "File" },
    h = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    w = { "<cmd>Ag <c-r>=expand(\"<cword>\")<cr><Enter>", "Word under cursor" },
    t = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree" },
  }, 

  s = {
    name = "Split",
    v = { "<cmd>vs %<cr>", "Vertical"},
    h = { "<cmd>split %<cr>", "Horizontal"},
  },

  t = {
    name = "Tab",
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
}, { prefix = "<leader>" })

wk.register({
  ["<C-h>"] = {"<C-w>h", "Left tab"},
  ["<C-j>"] = {"<C-w>j", "Down tab"},
  ["<C-k>"] = {"<C-w>k", "Up tab"},
  ["<C-l>"] = {"<C-w>l", "Right tab"},
  ["<leader><Tab>"] = {"<C-w>w", "Next tab"},
})

