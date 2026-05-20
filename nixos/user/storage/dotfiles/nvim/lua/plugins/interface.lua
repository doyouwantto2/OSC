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
      -- The require("everforest") line is only necessary if you need to call
      -- a setup function for the colorscheme itself (e.g., everforest.setup()).
      -- Since LazyVim is setting the colorscheme in the next block,
      -- we can remove the local variable assignment if no setup is needed.
      -- If you DO need to configure everforest, put that setup call here.
      -- Example: require("everforest").setup({})
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
