return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", "go", "gomod", "gowork", "gosum", "tsx",
                "html", "css", "json", "yaml",
            },

            sync_install = false,

            auto_install = true,

            indent = { enable = true },

            highlight = {
                enable = true,
                disable = function(lang, buf)
                    -- Disable Treesitter for HTML if doing plain web development (optional)
                    if lang == "html" then
                        return true
                    end

                    -- Disable Treesitter for large files (>100KB)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        vim.notify(
                            "File larger than 100KB: Treesitter disabled for performance",
                            vim.log.levels.WARN,
                            { title = "Treesitter" }
                        )
                        return true
                    end
                end,

                -- Enable Vim syntax highlighting alongside Treesitter for Markdown
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end
}
