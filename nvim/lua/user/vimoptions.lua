vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.termguicolors = true
vim.opt.backspace = 'indent,eol,start' -- Intuitive backspacing
vim.opt.hidden = true -- Handle multiple buffers better
vim.opt.wildmode = 'list:longest' -- Complete files like a shell
vim.opt.wildignore = "*/node_modules/**"
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- But case-sensitive if expression contains a capital letter
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show numbers relative to position
vim.opt.ruler = true -- Show cursor position
vim.opt.incsearch = true -- Highlight matches as you type
vim.opt.hlsearch = true -- Highlight matches

vim.opt.wrap = true -- Turn on line wrapping
vim.opt.scrolloff = 6 -- Show 3 lines of context around the cursor.
vim.opt.showmatch = true
vim.opt.title = true -- Set the terminal's title

vim.opt.visualbell = true -- No beeping
vim.opt.errorbells = false -- Stop the beeping
vim.opt.backup = false -- Don't make a backup before overwriting a file
vim.opt.writebackup = false -- And again
vim.opt.swapfile = false -- Don't make swapfiles
vim.opt.backupskip = "/tmp/*,/private/tmp/*"
vim.opt.undodir = '~/.vim/undo'

vim.opt.laststatus = 2 -- Always show the status line
vim.opt.shortmess = 'a' -- Avoid 'Hit ENTER to continue'

vim.opt.autoindent = true -- Indent at the same level as previous line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
