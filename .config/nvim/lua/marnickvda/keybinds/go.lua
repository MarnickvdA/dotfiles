vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    group = vim.api.nvim_create_augroup("GoKeybinds", { clear = true }),
    callback = function()
        -- Insert Go error return
        vim.keymap.set("n", "<leader>gee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { buffer = true, desc = "Insert Go error return" })

        -- Insert Go assert error check
        vim.keymap.set("n", "<leader>gea", "oassert.NoError(err, \"\")<Esc>F\";a", { buffer = true, desc = "Insert Go assert error check" })

        -- Insert Go fatal log error
        vim.keymap.set("n", "<leader>gef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj", { buffer = true, desc = "Insert Go fatal log error" })

        -- Insert Go structured logging error
        vim.keymap.set("n", "<leader>gel", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i", { buffer = true, desc = "Insert Go structured logging error" })
    end
})

