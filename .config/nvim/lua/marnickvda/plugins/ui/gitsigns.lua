return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()

        vim.keymap.set("n", "<leader>gb", function()
            require("gitsigns").blame_line({ full = true })
        end, { desc = "Git blame line" })
    end,
}
