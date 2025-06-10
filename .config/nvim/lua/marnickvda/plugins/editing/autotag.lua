return {
    "windwp/nvim-ts-autotag",
    lazy = false,
    ft = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require 'nvim-ts-autotag'.setup()
    end,
}
