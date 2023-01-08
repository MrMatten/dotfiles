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
    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
    use {
        'jose-elias-alvarez/null-ls.nvim',
    }

    use {
        'MunifTanjim/prettier.nvim',
        config = function()
            require('config.prettier')
        end
    }

    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
    }

    -- Snippet completion
    use {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        requires = {
            { "hrsh7th/cmp-buffer", module = "cmp_buffer" },
            { "hrsh7th/cmp-path", module = "cmp_path" },
            { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
            { "hrsh7th/cmp-nvim-lua", module = "cmp_nvim_lua" },
            { 'hrsh7th/cmp-cmdline', module = "cmp_cmdline" },
            { 'L3MON4D3/LuaSnip' },
            { 'David-Kunz/cmp-npm' },
            { 'saadparwaiz1/cmp_luasnip', module = "cmp_luasnip" }
        },

        config = function()
            require("config.cmp")
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

    -- Buffer line
    use {
        "akinsho/nvim-bufferline.lua",
        event = "BufReadPre",
        wants = "nvim-web-devicons",
        config = function()
            require("config.bufferline")
        end,
    }

    -- Extra functionality
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-obsession'
    use 'folke/trouble.nvim'
    use { "nvim-lua/plenary.nvim" }
end)
