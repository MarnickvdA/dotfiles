local highlight_config = require("marnickvda.plugins.core.treesitter.highlight")
local textobjects_config = require("marnickvda.plugins.core.treesitter.textobjects")

return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = require("marnickvda.core.config").ensure_installed.treesitter,
                sync_install = false,
                auto_install = true,
                indent = { enable = true },
                highlight = highlight_config,
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
                textobjects = textobjects_config,
            })
        end,
    },
}
