return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function(opts)
        require("catppuccin").setup({
            transparent_background = true,
            flavour = "macchiato",
        })

        vim.cmd.colorscheme("catppuccin-macchiato")
    end
}
