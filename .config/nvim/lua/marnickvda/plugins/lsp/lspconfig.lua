return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason-lspconfig").setup({
            ensure_installed = require("marnickvda.core.config").ensure_installed.mason,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                                telemetry = { enable = false },
                            },
                        },
                    })
                end,

                ["tailwindcss"] = function()
                    require("lspconfig").tailwindcss.setup({
                        capabilities = capabilities,
                        filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
                        root_dir = require("lspconfig").util.root_pattern(
                            "tailwind.config.js",
                            "tailwind.config.ts",
                            "package.json",
                            ".git"
                        ),
                    })
                end,
            },
        })
    end,
}
