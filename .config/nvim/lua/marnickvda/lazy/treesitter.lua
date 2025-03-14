return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- Ensure parsers for React (TSX) and Golang are installed
                ensure_installed = {
                    "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                    "jsdoc", "bash", "go", "gomod", "gowork", "gosum", "tsx",
                    "html", "css", "json"
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
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
                                {title = "Treesitter"}
                            )
                            return true
                        end
                    end,

                    -- Enable Vim syntax highlighting alongside Treesitter for Markdown
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        config = function()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false, -- Enable multiwindow support.
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                separator = nil, -- Separator between context and content
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    }
}

