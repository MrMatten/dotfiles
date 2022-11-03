return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- LSP config
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'folke/trouble.nvim'
	use 'creativenull/diagnosticls-configs-nvim'

	-- Snippet completion
	use {
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		opt = true,
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'David-Kunz/cmp-npm'
		},
		config = function()
			require("config.lsp")
		end,
		wants = { "LuaSnip" }
	}

	-- Git
	use 'lewis6991/gitsigns.nvim'

	-- File Management
	use { 
		'nvim-telescope/telescope.nvim', 
		opt = true,
		cmd = { "Telescope" },
		module = { "telescope", "telescope.builtin" },
		wants = {
			"plenary.nvim",
			"popup.nvim",
			"telescope-fzf-native.nvim",
			"telescope-file-browser.nvim",
			"telescope-ag.nvim"
		},
		requires = { 
			'nvim-lua/plenary.nvim', 
			'nvim-lua/popup.nvim', 
			use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
			'nvim-telescope/telescope-file-browser.nvim',
			'kelly-lin/telescope-ag'
		},
		config = function()
			require('config.telescope')
		end
	}

	use { 
		'kyazdani42/nvim-tree.lua',
		opt = true,
		wants = "nvim-web-devicons",
		cmd = { "NvimTreeToggle", "NvimTreeClose" },
		module = "nvim-tree",
		config = function()
			require('config.nvimtree')
		end
	}

	use 'ThePrimeagen/harpoon'

	use {
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		event = "BufReadPre",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
			{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
			{ "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
			{ "p00f/nvim-ts-rainbow", event = "BufReadPre" },
			-- { "yioneko/nvim-yati", event = "BufReadPre" },
		},
	}

	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'MaxMEllon/vim-jsx-pretty' -- fix indentation in jsx until treesitter can
	use 'jxnblk/vim-mdx-js'
	use 'tpope/vim-obsession'

	-- test
	use {
		"nvim-neotest/neotest",
		opt = true,
		wants = {
			"plenary.nvim",
			"nvim-treesitter",
			"FixCursorHold.nvim",
			"neotest-python",
			"neotest-plenary",
			"neotest-go",
			"neotest-jest",
			"neotest-vim-test",
		},
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-go",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-vim-test",
		},
		module = { "neotest" },
		config = function()
			require("config.test")
		end,
	}

	-- Keybindings
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end
	}
	-- Colours
	use 'kristijanhusak/vim-hybrid-material'
	use 'chriskempson/base16-vim'
	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('config.colorizer')
		end
	}

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('config.lualine')
		end
	}

	-- Languages
	use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
	use 'sheerun/vim-polyglot'

	-- Extra functionality
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
end)
