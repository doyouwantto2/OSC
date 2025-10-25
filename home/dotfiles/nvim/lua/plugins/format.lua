return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sleek" },
        -- 1. Map 'nasmfmt' to the assembly filetype
        asm = { "nasmfmt" },
        -- Optionally, if you use '.s' files for assembly:
        -- s = { "nasmfmt" },
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
        -- 2. Define the 'nasmfmt' formatter
        nasmfmt = {
          -- 'nasmfmt' is the command executable (must be in your PATH)
          command = "nasmfmt",
          -- 'nasmfmt' reads from stdin and writes to stdout,
          -- so no custom args are typically needed unless you use specific flags.
          stdin = true,
        },
      },
    },
  },
}
