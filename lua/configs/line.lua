require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "ayu"
    },
    sections_a = {
        lualine_a = {
            { 'filename', path = 1 }
        }
    }
}
