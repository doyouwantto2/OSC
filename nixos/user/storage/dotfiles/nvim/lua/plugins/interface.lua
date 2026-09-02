return {
  {
    "tribela/transparent.nvim",
    event = "VimEnter",
    config = true,
  },

  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "soft",
        transparent_background_level = 1,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- The second, empty lualine entry was merged into this one.
    opts = function(_, opts)
      -- This ensures that the original lualine configuration is modified,
      -- rather than being completely overwritten by an empty table.
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },
}
