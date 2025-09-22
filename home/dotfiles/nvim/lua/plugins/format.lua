return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sleek" }, -- keep this if you want Sleek for SQL
      },
      formatters = {
        sleek = {
          command = "sleek",
          args = {
            "--indent-spaces", "2",
            "--uppercase", "false",
            "--lines-between-queries", "1",
          },
          stdin = true,
        },
      },
    },
  },
}
