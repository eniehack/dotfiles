vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {unpack(opts), desc = "declaration"})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {unpack(opts), desc = "definition"})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {unpack(opts), desc = "hover"})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {unpack(opts), desc = "implementation"})
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {unpack(opts), desc = "signature"})
        vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, {unpack(opts), desc = "add workspace"})
        vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, {unpack(opts), desc = "remove workspace"})
        vim.keymap.set('n', '<leader>lwl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,{unpack(opts), desc = "list workspace"} )
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, {unpack(opts), desc = "type definition"})
        vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, {unpack(opts), desc = "rename"})
        vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, {unpack(opts), desc = "code action"})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {unpack(opts), desc = "show references"})
        vim.keymap.set('n', '<leader>lf', function()
          vim.lsp.buf.format { async = true }
        end, {unpack(opts), desc = "format"})
    end,
})
