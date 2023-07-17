local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "folke/lazy.nvim",
    "ellisonleao/gruvbox.nvim",
    { 'rose-pine/neovim', name = 'rose-pine' },
    "nvim-tree/nvim-web-devicons",
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
    },
    "nvim-tree/nvim-tree.lua",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets'
        }
    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "folke/trouble.nvim",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
    "jiangmiao/auto-pairs",
    {
        'VonHeikemen/fine-cmdline.nvim',
        dependencies = {
            { 'MunifTanjim/nui.nvim' }
        }
    },
    'rcarriga/nvim-notify',
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install"
    },
    { 'akinsho/toggleterm.nvim', version = "*",     config = true },
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup {}
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup {}
        end
    }
}

require("lazy").setup(plugins, {})
