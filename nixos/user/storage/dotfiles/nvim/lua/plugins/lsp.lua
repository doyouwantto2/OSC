local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local capabilities = require("blink.cmp").get_lsp_capabilities()

--------------------------------------------------
-- Keymaps
--------------------------------------------------
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

--------------------------------------------------
-- Plugins
--------------------------------------------------
return {
  ------------------------------------------------
  -- LSPCONFIG
  ------------------------------------------------
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "pmizio/typescript-tools.nvim",
    },

    config = function()
      ------------------------------------------------
      -- Lua
      ------------------------------------------------
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- HTML
      ------------------------------------------------
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- CSS
      ------------------------------------------------
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      })

      ------------------------------------------------
      -- JSON
      ------------------------------------------------
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- Python
      ------------------------------------------------
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- C / C++
      ------------------------------------------------
      lspconfig.ccls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- Astro
      ------------------------------------------------
      lspconfig.astro.setup({
        capabilities = capabilities,
        on_attach = on_attach,

        cmd = { vim.fn.getcwd() .. "/node_modules/.bin/astro-ls", "--stdio" },

        init_options = {
          typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
          },
        },
      })

      ------------------------------------------------
      -- Nix
      ------------------------------------------------
      lspconfig.nixd.setup({
        capabilities = capabilities,
        on_attach = on_attach,

        settings = {
          nixd = {
            formatting = {
              command = { "nixfmt" },
            },
          },
        },
      })

      ------------------------------------------------
      -- Docker
      ------------------------------------------------
      lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- YAML
      ------------------------------------------------
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- LaTeX
      ------------------------------------------------
      lspconfig.texlab.setup({
        capabilities = capabilities,
        on_attach = on_attach,

        settings = {
          texlab = {
            build = {
              executable = "latexmk",

              args = {
                "-pdfxe",
                "-interaction=nonstopmode",
                "-synctex=1",
                "%f",
              },

              onSave = true,
            },

            forwardSearch = {
              executable = "zathura",

              args = {
                "--synctex-forward",
                "%l:1:%f",
                "%p",
              },
            },
          },
        },
      })

      ------------------------------------------------
      -- Typst / Tinymist
      ------------------------------------------------
      lspconfig.tinymist.setup({
        cmd = { "tinymist" },

        filetypes = { "typst" },

        root_dir = util.root_pattern(".git", "typst.toml"),

        single_file_support = true,

        capabilities = capabilities,

        on_attach = on_attach,

        settings = {
          formatterMode = "typstyle",

          exportPdf = "onType",

          semanticTokens = "disable",
        },
      })

      ------------------------------------------------
      -- Solidity
      ------------------------------------------------
      lspconfig.solidity_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,

        cmd = {
          vim.fn.getcwd() .. "/node_modules/.bin/@nomicfoundation/solidity-language-server",
          "--stdio",
        },

        filetypes = { "solidity" },

        root_dir = util.root_pattern(
          "foundry.toml",
          "hardhat.config.ts",
          "hardhat.config.js",
          "hardhat.config.cjs",
          "hardhat.config.mjs",
          "truffle-config.js",
          "package.json",
          ".git"
        ),

        single_file_support = true,
      })

      lspconfig.marksman.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = {
          "html",
          "css",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "astro",
          "solid",
          "typescript",
        },
        -- Đảm bảo LSP nhận diện đúng root của project Tailwind
        root_dir = util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts"
        ),
      })

      ------------------------------------------------
      -- TypeScript
      ------------------------------------------------
      require("typescript-tools").setup({
        capabilities = capabilities,

        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false

          on_attach(client, bufnr)
        end,

        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = "insert_leave",
          expose_as_code_action = "all",
        },
      })
    end,
  },

  ------------------------------------------------
  -- Rust
  ------------------------------------------------
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },

  ------------------------------------------------
  -- VimTeX
  ------------------------------------------------
  {
    "lervag/vimtex",

    lazy = false,

    init = function()
      vim.g.vimtex_view_method = "zathura"

      vim.g.vimtex_compiler_method = "latexmk"

      vim.g.vimtex_compiler_latexmk = {
        executable = "latexmk",

        options = {
          "-pdfxe",
          "-shell-escape",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
        },
      }
    end,
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  ------------------------------------------------
  -- Typst Preview
  ------------------------------------------------
  {
    "chomosuke/typst-preview.nvim",

    ft = "typst",

    version = "1.*",

    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "3rd/diagram.nvim",
    dependencies = {
      { "3rd/image.nvim", opts = {} }, -- you'd probably want to configure image.nvim manually instead of doing this
    },
    opts = { -- you can just pass {}, defaults below
      events = {
        render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
        clear_buffer = { "BufLeave" },
      },
      renderer_options = {
        mermaid = {
          background = nil, -- nil | "transparent" | "white" | "#hex"
          theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 1, -- nil | 1 (default) | 2  | 3 | ...
          width = nil, -- nil | 800 | 400 | ...
          height = nil, -- nil | 600 | 300 | ...
          cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
        },
        plantuml = {
          charset = nil,
          cli_args = nil, -- nil | { "-Djava.awt.headless=true" } | ...
        },
        d2 = {
          theme_id = nil,
          dark_theme_id = nil,
          scale = nil,
          layout = nil,
          sketch = nil,
          cli_args = nil, -- nil | { "--pad", "0" } | ...
        },
        gnuplot = {
          size = nil, -- nil | "800,600" | ...
          font = nil, -- nil | "Arial,12" | ...
          theme = nil, -- nil | "light" | "dark" | custom theme string
          cli_args = nil, -- nil | { "-p" } | { "-c", "config.plt" } | ...
        },
      },
    },
  },
}
