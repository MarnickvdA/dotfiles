return {
    ensure_installed = {
        mason = {
            -- Formatters
            "stylua", -- Lua
            "shfmt", -- Shell
            "prettier", -- Web (JS/TS/CSS/HTML/Markdown/etc)
            "black", -- Python
            "isort", -- Python (import sorting)
            "gofmt", -- Go
            "sqlfmt", -- SQL
            "odinfmt", -- Odin

            -- Language Servers (LSPs)
            "lua_ls", -- Lua
            "rust_analyzer", -- Rust
            "gopls", -- Go
            "tsserver", -- JavaScript/TypeScript
            "eslint", -- Linter for JS/TS
            "tailwindcss", -- Tailwind CSS
            "marksman", -- Markdown
            "taplo", -- TOML
            "ols", -- Odin
        },

        treesitter = {
            "bash",
            "vimdoc",
            "c",
            "lua",
            "rust",
            "go",
            "gomod",
            "gowork",
            "gosum",
            "gotmpl",
            "javascript",
            "jsdoc",
            "typescript",
            "tsx",
            "html",
            "css",
            "json",
            "yaml",
            "gitignore",
            "dockerfile",
            "vim",
            "markdown",
            "rust",
            "ron",
        },
    },
}
