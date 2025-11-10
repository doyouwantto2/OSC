return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = {
      -- 🔑 REMOVED: The format_on_save table is no longer present.

      -- Set formatters by filetype
      formatters_by_ft = {
        lua = { "stylua" },
        sql = { "sleek" },
      },

      -- Define custom formatters (like sleek)
      formatters = {
        stylua = {},
        sleek = {
          command = "sleek",
          args = {
            "--indent-spaces",
            "2",
            "--uppercase",
            "false",
            "--lines-between-queries",
            "1",
          },
          stdin = true,
        },
        ktfmt = {
          command = "ktfmt",
        },
      },

      -- The keymap must remain in config, as LazyVim doesn't auto-set <leader>fm
      config = function(_, opts)
        require("conform").setup(opts)
        vim.keymap.set({ "n", "v" }, "<leader>fm", function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end, { desc = "Format file or range" })
      end,
    },
  },
}
