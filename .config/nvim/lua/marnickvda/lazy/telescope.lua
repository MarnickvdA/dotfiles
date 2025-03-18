return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules", ".git", "dist", "build", "vendor",
                    "%.lock", "%-lock%.json", "yarn%.lock", "pnpm%-lock%.yaml",
                    "go%.sum", "Cargo%.lock", "composer%.lock",
                    "%.min.js", "%.png", "%.jpg", "%.jpeg"
                },
                vimgrep_arguments = {
                    "fd", "--type", "f", "--hidden",
                    "--exclude", ".git", "--exclude", "node_modules",
                    "--exclude", "*.lock", "--exclude", "package-lock.json",
                    "--exclude", "yarn.lock", "--exclude", "pnpm-lock.yaml",
                    "--exclude", "go.sum", "--exclude", "Cargo.lock", "--exclude", "composer.lock"
                },
            },
            pickers = {
                live_grep = {
                    additional_args = function()
                        return {
                            "--glob", "!node_modules/*",
                            "--glob", "!dist/*",
                            "--glob", "!vendor/*",
                            "--glob", "!package-lock.json",
                            "--glob", "!yarn.lock",
                            "--glob", "!pnpm-lock.yaml",
                            "--glob", "!go.sum",
                            "--glob", "!Cargo.lock",
                            "--glob", "!composer.lock"
                        }
                    end
                }
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope: Find All Files" })
        vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = "Telescope: Find Git Project Files" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope: Buffers" })
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope: Grep > [Input]" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc="Telescope: Help Tags"})

        require('telescope').load_extension("noice")
    end
}
