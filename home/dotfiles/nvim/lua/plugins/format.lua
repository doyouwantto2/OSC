return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sleek" },
      },
      formatters = {
        sleek = {
          command = "sleek",
          args = {
            "--indent-spaces", "2", -- correct flag
            "--uppercase", "false", -- keep keywords lowercase
            "--lines-between-queries", "1",
          },
          stdin = true,
        },
      },
    },
  },
}
