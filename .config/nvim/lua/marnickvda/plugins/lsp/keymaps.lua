return {
    "neovim/nvim-lspconfig",
    event = "LspAttach",
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP Keymaps",
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>mn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>mR", function()
                    vim.lsp.buf.code_action({ apply = true })
                end, { buffer = event.buf, desc = "Apply first code action" })

                vim.keymap.set("n", "<leader>mr", function()
                    vim.lsp.buf.code_action({ context = { only = { "source" } } })
                end, { buffer = event.buf, desc = "Code actions" })
            end,
        })
    end,
}
