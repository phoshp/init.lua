vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No Highlight" })
vim.keymap.set("n", "<leader>s", ":w!<CR>", { desc = "Save File" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Quit" })
vim.keymap.set("n", "<Tab>", ":bprev<CR>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-q>", ":bd!<CR>", { desc = "Close Buffer" })
