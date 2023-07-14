require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "rose-pine"
    },
    sections_a = {
        lualine_a = {
            { 'filename', path = 1 }
        }
    }
}
