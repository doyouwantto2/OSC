return {
  {
    "tribela/transparent.nvim",
    event = "VimEnter",
    config = true,
  },

  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000, -- ensure it loads before other plugins
    config = function()
      local everforest = require("everforest")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
