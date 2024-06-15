local triptych = require('triptych')
triptych.setup {
    options = {
        backdrop = 100,
        border = 'single'
    }
}
vim.keymap.set('n', '<C-n>', ':Triptych<CR>', { silent = true })

pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    once = true,
    callback = function()
        pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
    end,
})
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("HijackNetrw", { clear = true }),
    pattern = "*",
    callback = function()
        vim.schedule(function()
            if vim.bo[0].filetype == "netrw" then
                return
            end
            local bufname = vim.api.nvim_buf_get_name(0)
            if vim.fn.isdirectory(bufname) == 0 then
                return
            end

            local path = vim.fn.expand("%:p:h")
            vim.cmd("bd 1")
            triptych.toggle_triptych(path)
        end)
    end,
    desc = "Replace netrw",
})
