vim.g.mapleader = " "

-- 🏗 File Explorer
vim.keymap.set("n", "<leader>pv", function()
    require("nvim-tree.api").tree.toggle()
end, { desc = "Open file explorer", noremap=true,silent=true })

-- 📑 Navigation Enhancements
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines but keep cursor in place" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half-page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half-page and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep search results centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep previous search results centered" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- Noice keymaps
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Notification Message"})

-- 🔄 Moving lines up/down in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- 🖇️ Clipboard & Pasting Improvements
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting clipboard" })
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy entire line to system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { desc = "Delete without copying" })

-- 🛑 Fix Annoying Defaults
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Use <C-c> as <Esc>" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- 🎯 LSP Actions
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- 🔍 Quick Search & Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- 🛠 Make Current File Executable
vim.keymap.set("n", "<leader>Ex", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- 🔄 Source Neovim Config
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Reload Neovim config" })

