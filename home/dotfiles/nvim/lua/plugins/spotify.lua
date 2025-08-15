return {
  "stsewd/spotify.nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    require("spotify").setup()
  end,
  init = function()
    -- Optional mappings.
    vim.keymap.set("n", "<leader>ss", ":Spotify play/pause<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sj", ":Spotify next<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sk", ":Spotify prev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>so", ":Spotify show<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sc", ":Spotify status<CR>", { silent = true })
  end,
},
