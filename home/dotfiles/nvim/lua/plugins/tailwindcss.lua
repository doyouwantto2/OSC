return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      server = {
        override = true,
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = { "tw\\('([^']*)'\\)" },
            },
            includeLanguages = {
              astro = "html",
              typescriptreact = "typescriptreact",
              javascriptreact = "javascriptreact",
            },
          },
        },
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>tc", "<cmd>TailwindSort<CR>", { buffer = bufnr, desc = "Sort Tailwind classes" })
          vim.keymap.set("v", "<leader>ts", "<cmd>TailwindSortSelection<CR>",
            { buffer = bufnr, desc = "Sort Tailwind classes (selection)" })
        end,
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "tailwind.config.cjs",
            "astro.config.mjs",
            "package.json"
          )(fname) or require("lspconfig.util").path.dirname(fname)
        end,
      },
      document_color = {
        enabled = true,
        kind = "background", -- or "inline"
        inline_symbol = "󰝤 ",
        debounce = 200,
      },
      conceal = {
        enabled = true,
        min_length = 1,
        symbol = "󱏿",
        highlight = { fg = "#38BDF8" },
      },
      keymaps = {
        smart_increment = {
          enabled = true,
          units = {
            { prefix = "p",    values = { "0", "1", "2", "4", "8", "16", "24", "32" } },
            { prefix = "m",    values = { "0", "1", "2", "4", "8", "16" } },
            { prefix = "text", values = { "xs", "sm", "base", "lg", "xl", "2xl", "3xl" } },
          },
        },
      },
      cmp = { highlight = "foreground" },
      telescope = {
        utilities = {
          callback = function(name, class)
            vim.notify("Selected Tailwind class: " .. name .. " → " .. class)
          end,
        },
      },
      extension = {
        patterns = {
          javascript = { "clsx%(([^)]+)%)" },
          typescript = { "clsx%(([^)]+)%)" },
          astro = { "class=\"([^\"]+)\"" },
        },
      },
    },
    config = function(_, opts)
      require("tailwind-tools").setup(opts)
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "astro", "html", "css", "tsx", "typescript", "javascript" },
        highlight = { enable = true },
      })
    end,
  },
}
