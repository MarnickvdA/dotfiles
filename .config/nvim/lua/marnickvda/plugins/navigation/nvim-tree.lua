return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            view = {
                width = "15%",
                adaptive_size = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            hijack_cursor = true,
            diagnostics = { enable = true },
            git = { enable = true },
            filters = {
                git_ignored = false,
                custom = { ".DS_Store" },
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                    resize_window = false,
                },
            },
        })

        -- Open nvim-tree on startup only if opening a directory
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local is_directory = vim.fn.isdirectory(vim.fn.expand("%:p"))
                if is_directory == 1 then
                    require("nvim-tree.api").tree.open()
                end
            end,
        })
    end,
}
