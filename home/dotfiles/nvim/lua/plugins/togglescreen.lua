return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      open_mapping = [[<M-\>]],
      float_opts = {
        border = "curved", -- Optional: other options are "single", "double", "shadow", etc.
        width = function()
          return vim.o.columns - 4
        end,
        height = function()
          return vim.o.lines - 4 -- minus 2 for command line
        end,
        winblend = 0,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
  end,
}
