return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local window_size = 0.7

        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            view = {
                float = {
                    enable = true,             -- Enable floating mode
                    quit_on_focus_loss = true, -- Auto-close when focus is lost
                    open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = math.floor(vim.o.columns * window_size),
                        height = math.floor(vim.o.lines * window_size),
                        row = math.floor(vim.o.lines * ((1 - window_size) / 2)),  -- Center it vertically
                        col = math.floor(vim.o.columns * ((1 - window_size) / 2)), -- Center it horizontally
                    },
                },
                width = 30, -- Not relevant for floating mode but required
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
                custom = { ".DS_Store" }
            },
            actions = {
                open_file = {
                    quit_on_open = true, -- Close tree when opening a file
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
            end
        })
    end,
}
