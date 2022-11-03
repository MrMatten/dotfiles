local telescope = require'telescope'

telescope.setup {
  defaults = {
      file_ignore_patterns = { "yarn.lock", "node_modules/" }
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<M-d>"] = "delete_buffer",
        }
      }
    }
  }
}
telescope.load_extension 'fzf'
telescope.load_extension 'ag'
telescope.load_extension 'file_browser'
