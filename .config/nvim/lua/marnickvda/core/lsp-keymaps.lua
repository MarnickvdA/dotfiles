local M = {}

function M.setup_keymaps(event)
    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- local client_name = client and client.name or "unknown"
    -- print("🔗 LSP attached to buffer " .. event.buf .. " with client: " .. client_name)

    local telescope = require("telescope.builtin")

    local keymaps = {
        ["K"] = { vim.lsp.buf.hover, "LSP: Hover documentation" },
        ["gD"] = { vim.lsp.buf.declaration, "LSP: Go to declaration" },
        ["gd"] = { telescope.lsp_definitions, "LSP: Go to definition" },
        ["gi"] = { telescope.lsp_implementations, "LSP: Go to implementation" },
        ["go"] = { telescope.lsp_type_definitions, "LSP: Go to type definition" },
        ["gr"] = { telescope.lsp_references, "LSP: Go to references" },
        ["gK"] = { vim.lsp.buf.signature_help, "LSP: Signature help" },
    }

    local leader_keymaps = {
        m = {
            name = "LSP Actions",
            R = {
                function()
                    vim.lsp.buf.code_action({ apply = true })
                end,
                "Apply first code action",
            },
            i = {
                function()
                    vim.lsp.buf.code_action({
                        context = {
                            only = { "source.organizeImports" },
                        },
                        apply = true,
                    })
                end,
                "Organize imports",
            },
            n = { vim.lsp.buf.rename, "Rename symbol" },
            r = { telescope.lsp_code_actions, "Code actions" },
        },
        l = {
            name = "LSP Info",
            s = { telescope.lsp_document_symbols, "Document symbols" },
            S = { telescope.lsp_workspace_symbols, "Workspace symbols" },
            d = {
                function()
                    telescope.diagnostics({ bufnr = 0 })
                end,
                "Document diagnostics",
            },
            D = { telescope.diagnostics, "Workspace diagnostics" },
        },
    }

    -- Register with which-key
    local ok, wk = pcall(require, "which-key")
    if ok then
        -- print("🔑 Registering keymaps with which-key")
        wk.register(keymaps, { buffer = event.buf })
        wk.register(leader_keymaps, { prefix = "<leader>", buffer = event.buf })
        -- print("✅ LSP keymaps registered with which-key for buffer " .. event.buf)
    else
        print("⚠️  which-key not available")
    end
end

return M
