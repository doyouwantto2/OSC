-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- normal mode mappings
vim.keymap.set("n", "<C-l>", "e", { noremap = true })
vim.keymap.set("n", "<C-h>", "b", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-d>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-u>", { noremap = true })

-- disable original keys
vim.keymap.set("n", "e", "<Nop>")
vim.keymap.set("n", "b", "<Nop>")
vim.keymap.set("n", "<C-d>", "<Nop>")
vim.keymap.set("n", "<C-u>", "<Nop>")

-- visual mode (make sure movement applies properly)
vim.keymap.set("v", "<C-l>", ":normal! e<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-h>", ":normal! b<CR>", { noremap = true, silent = true })

