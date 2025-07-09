return {
  "sphamba/smear-cursor.nvim",

  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,

    cursor_color = "#f5f5f5",
    stiffness = 0.5,
    trailing_stiffness = 0.8,
    damping = 0.7,
    trailing_exponent = 5,
    never_draw_over_target = true,
    hide_target_hack = true,
    gamma = 1,
  },
}
