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
        -- Giữ nguyên cấu hình cũ của cậu
        lua = { "stylua" },
        typst = { "typstyle" },

        -- BỔ SUNG HỆ SINH THÁI WEB (Astro / SolidJS / Tailwind)
        astro = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        solid = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
      },

      formatters = {
        stylua = {},
        -- Có thể thêm override cho prettier ở đây nếu cần thiết sau này
      },
    },

    -- Xóa hoàn toàn function config rườm rà cũ của cậu đi
    -- Lazy sẽ tự động gọi require("conform").setup(opts)
  },
}
