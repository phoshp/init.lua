require("nvim-tree").setup({
    sort_by = "case_sensitive",
    update_cwd = true,
    view = {
        width = 30,
        float = {
            enable = true
        }
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
