return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
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

        local lspconfig = require("lspconfig")
        local util = require("lspconfig/util")

        require("mason-lspconfig").setup({
            ensure_installed = {
                -- Language Servers (LSPs)
                "lua_ls", -- Lua
                "rust_analyzer", -- Rust
                "gopls", -- Go
                "ts_ls", -- JavaScript/TypeScript
                "eslint", -- Linter for JS/TS
                "tailwindcss", -- Tailwind CSS
                "marksman", -- Markdown
                "taplo", -- TOML
                "ols", -- Odin
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({ capabilities = capabilities })
                end,

                ["gopls"] = function()
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
                        cmd = { "gopls" },
                        filetypes = { "go", "gomod", "gowork", "gotmpl" },
                        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                        flags = {
                            debounce_text_changes = 150,
                        },
                        settings = {
                            gopls = {
                                analyses = {
                                    unusedparams = true,
                                    unusedwrite = true,
                                    useany = true,
                                    nilness = true,
                                    shadow = true,
                                    fieldalignment = true,
                                    unusedvariable = true,
                                    ST1000 = true,
                                    ST1003 = true,
                                },

                                hints = {
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    constantValues = true,
                                    functionTypeParameters = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                },

                                completeUnimported = true,
                                usePlaceholders = true,
                                gofumpt = true,
                                staticcheck = true,

                                ["ui.completion.importShortcut"] = true,
                                ["ui.completion.matcher"] = "fuzzy",
                                ["ui.completion.usePlaceholders"] = true,

                                -- Enable more import completions
                                ["completion.importPackage"] = true,

                                -- Auto import suggestions
                                ["imports.granularity"] = "package",

                            },
                        },
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
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
                    lspconfig.tailwindcss.setup({
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

        local lsp_keymaps = require("marnickvda.core.lsp-keymaps")

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP Keymaps",
            callback = lsp_keymaps.setup_keymaps,
        })
    end,
}
