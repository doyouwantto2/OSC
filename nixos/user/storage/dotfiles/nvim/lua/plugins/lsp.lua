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

  ------------------------------------------------
  -- Typst Preview
  ------------------------------------------------
  {
    "chomosuke/typst-preview.nvim",

    ft = "typst",

    version = "1.*",

    opts = {},
  },
}
