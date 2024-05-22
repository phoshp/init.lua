require('nvim-ts-autotag').setup()

local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup {
    sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp.cmp_format(),
  mapping = cmp_mappings
}

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = bufnr })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" , buffer = bufnr })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder", buffer = bufnr })
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder", buffer = bufnr })
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "List workspace folders", buffer = bufnr })
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = "Type definition", buffer = bufnr })
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, { desc = "Rename item", buffer = bufnr })
    vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, { desc = "Code actions", buffer = bufnr })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to references", buffer = bufnr })
    vim.keymap.set('n', '<space>e', function()
        vim.lsp.buf.format { async = true }
    end, { desc = "Format file", buffer = bufnr })
end)

-- lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
