-- Load language specific keybindings
local keybinds_path = "marnickvda.keybinds"

local scan = vim.loop.fs_scandir(vim.fn.stdpath("config") .. "/lua/" .. keybinds_path:gsub("%.", "/"))

if scan then
    for name in function() return vim.loop.fs_scandir_next(scan) end do
        if name:match("%.lua$") then
            local module = keybinds_path .. "." .. name:gsub("%.lua$", "")
            require(module)
        end
    end
end
