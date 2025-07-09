return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,

    cursor_color = "#f5f5f5", -- light gray/white
    stiffness = 0.3,
    trailing_stiffness = 0.1,
    damping = 0.5,
    trailing_exponent = 5,
    never_draw_over_target = true,
    hide_target_hack = true,
    gamma = 1,
  },
  config = function(_, opts)
    require("smear-cursor").setup(opts)

    -- Make the cursor effect trail more transparent
    vim.api.nvim_set_hl(0, "SmearCursor", {
      fg = opts.cursor_color or "#f5f5f5",
      bg = "NONE", -- transparent background
      blend = 70,  -- transparency level (0 = opaque, 100 = invisible)
    })
  end,
}

