return {
  "NickvanDyke/opencode.nvim",
  -- Recommended for 'ask()' and 'select()'.
  dependencies = {
    {
      "folke/snacks.nvim",
      opts = {
        input = {},
        picker = {},
        terminal = {},
      },
    },
  },

  -- The configuration function executes when the plugin loads
  config = function()
    -- Configuration Options (None required, but available here)
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see :h opencode-config
    }

    -- Required for `opts.auto_reload`.
    vim.o.autoread = true

    -- *** Keymaps using <leader> for non-conflicting AI workflow ***

    -- (Assuming <leader> is mapped to 'space', which is LazyVim default)

    -- 1. Main AI Selector (Your preferred keymap: <Space>a)
    -- This shows all available opencode actions in a picker menu.
    vim.keymap.set({ "n", "x" }, "<leader>a", function()
      require("opencode").select()
    end, { desc = "AI: Show Opencode actions" })

    -- 2. Direct Ask/Prompt
    -- Opens the input prompt directly, pre-filled with the selection or word under cursor.
    vim.keymap.set({ "n", "x" }, "<leader>A", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "AI: Ask on selection/word" })

    -- 3. Toggle the Session Window
    -- Toggles the visibility of the main Opencode session window.
    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "AI: Toggle Opencode session" })

    -- 4. Session Scrolling (Optional, but useful)
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "Opencode half page up" })

    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "Opencode half page down" })

    -- NOTE: By using this configuration, you avoid setting the conflicting
    -- default keymaps (<C-a>, <C-x>, +, -) and retain standard Neovim behavior.
  end,
}
