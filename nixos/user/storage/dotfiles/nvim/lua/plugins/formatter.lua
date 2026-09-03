return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },

    -- Khai báo phím tắt chuẩn của Lazy.nvim
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format file or range (Conform)",
      },
    },

    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        typst = { "typstyle" },

        astro = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        solid = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        vue = { "prettier" },
        markdown = { "mdformat" },
        ruby = { "rubyfmt" },
      },

      formatters = {
        stylua = {},
      },
    },
  },
}
