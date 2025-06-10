return {
    enable = true,
    disable = function(lang, buf)
        if lang == "html" then
            return true
        end

        local max_filesize = 500 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            vim.notify("File >500KB: Treesitter disabled", vim.log.levels.WARN, { title = "Treesitter" })
            return true
        end
    end,
    additional_vim_regex_highlighting = { "markdown" },
}
