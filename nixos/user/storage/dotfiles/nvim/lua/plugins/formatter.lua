return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = {

      formatters_by_ft = {
        lua = { "stylua" },
      },

      formatters = {
        stylua = {},
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
