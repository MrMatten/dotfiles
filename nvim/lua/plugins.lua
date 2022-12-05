vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Colours
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('config.treesitter')
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }

    use {
        'marko-cerovac/material.nvim',
        config = function()
            vim.g.material_style = "oceanic"
            require('material').setup({
                plugins = {
                    "gitsigns",
                    "nvim-cmp",
                    "nvim-tree",
                    "nvim-web-devicons",
                    "telescope",
                    "trouble",
                    "which-key",
                }
            })
            vim.cmd.colorscheme [[material]]
        end
    }

    use {
        'kyazdani42/nvim-web-devicons', opt = true
    }

    -- LSP config
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
    }
    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
    use 'folke/trouble.nvim'
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('config.null-ls')
        end,
    }
    use { "nvim-lua/plenary.nvim" }

    -- Languages
    use {
        'MunifTanjim/prettier.nvim',
        config = function()
            require('config.prettier')
        end
    }

    -- Snippet completion
    use {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        opt = true,
        config = function()
            require("config.cmp")
        end,
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'David-Kunz/cmp-npm'
        },
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
        keys = { "<leader>f" },
        wants = {
            "plenary.nvim",
            "popup.nvim",
            "telescope-fzf-native.nvim",
            "telescope-file-browser.nvim"
        },
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            "nvim-telescope/telescope-file-browser.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
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

    -- test
    use {
        "nvim-neotest/neotest",
        opt = true,
        wants = {
            "plenary.nvim",
            "FixCursorHold.nvim",
            "neotest-python",
            "neotest-plenary",
            "neotest-go",
            "neotest-jest",
            "neotest-vim-test",
        },
        requires = {
            "nvim-lua/plenary.nvim",
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
            require("user.whichkey")
        end
    }


    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('config.lualine')
        end
    }

    -- Extra functionality
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-obsession'
end)
