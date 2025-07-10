-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Safe remaps using Lua functions (won't be broken by <Nop>)
vim.keymap.set("n", "<C-l>", function() vim.cmd("normal! e") end, { noremap = true })
vim.keymap.set("n", "<C-h>", function() vim.cmd("normal! b") end, { noremap = true })
vim.keymap.set("n", "<C-j>", function() vim.cmd("normal! <C-d>") end, { noremap = true })
vim.keymap.set("n", "<C-k>", function() vim.cmd("normal! <C-u>") end, { noremap = true })

-- Now you can safely disable the originals
vim.keymap.set("n", "e", "<Nop>")
vim.keymap.set("n", "b", "<Nop>")
vim.keymap.set("n", "<C-d>", "<Nop>")
vim.keymap.set("n", "<C-u>", "<Nop>")

