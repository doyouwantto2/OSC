local lspconfig = require("lspconfig")
local fs = vim.fs
local keymap = vim.keymap.set

--------------------------------------------------
-- Root helper (Neovim 0.10+ safe)
--------------------------------------------------
local function root_from_file(fname, patterns)
  if not fname or fname == "" then
    return nil
  end
  return fs.root(fname, patterns)
end

local function root_from_buf(bufnr, patterns)
  local fname = vim.api.nvim_buf_get_name(bufnr)
  return root_from_file(fname, patterns)
end

--------------------------------------------------
-- Capabilities (nvim-cmp support)
--------------------------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

--------------------------------------------------
-- Common on_attach (TypeScript example)
--------------------------------------------------
local ts_on_attach = function(client, bufnr)
  -- Disable formatting (handled elsewhere)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
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
    opts = {
      servers = {
        ------------------------------------------------
        -- Lua
        ------------------------------------------------
        lua_ls = {
          cmd = { "lua-language-server" },
          capabilities = capabilities,
        },

        ------------------------------------------------
        -- Web
        ------------------------------------------------
        html = {
          cmd = { "vscode-html-language-server", "--stdio" },
          capabilities = capabilities,
        },

        cssls = {
          cmd = { "vscode-css-language-server", "--stdio" },
          capabilities = capabilities,
        },

        jsonls = {
          cmd = { "vscode-json-language-server", "--stdio" },
          capabilities = capabilities,
        },

        ------------------------------------------------
        -- TypeScript / JavaScript
        -- (handled by typescript-tools)
        ------------------------------------------------
        tsserver = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          root_dir = function(fname)
            return root_from_file(fname, {
              "tsconfig.json",
              "package.json",
              ".git",
            })
          end,
          on_attach = ts_on_attach,
          capabilities = capabilities,
        },

        ------------------------------------------------
        -- Python
        ------------------------------------------------
        pyright = {
          capabilities = capabilities,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
              },
            },
          },
        },

        ------------------------------------------------
        -- C / C++
        ------------------------------------------------
        ccls = {
          cmd = { "ccls" },
          capabilities = capabilities,
          init_options = {
            cache = { directory = ".ccls-cache" },
            compilationDatabaseDirectory = "build",
          },
        },

        ------------------------------------------------
        -- Astro (FIXED)
        ------------------------------------------------
        astro = {
          cmd = { "astro-ls", "--stdio" },
          filetypes = { "astro" },
          capabilities = capabilities,
          root_dir = function(fname)
            return root_from_file(fname, {
              "astro.config.mjs",
              "astro.config.ts",
              "package.json",
              "tsconfig.json",
              ".git",
            })
          end,
        },

        ------------------------------------------------
        -- Nix
        ------------------------------------------------
        nixd = {
          cmd = { "nixd" },
          capabilities = capabilities,
          settings = {
            nixd = {
              formatting = {
                command = { "nixpkgs-fmt" },
              },
            },
          },
        },
      },

      ------------------------------------------------
      -- typescript-tools integration
      ------------------------------------------------
      setup = {
        tsserver = function(_, opts)
          local ts_tools = require("typescript-tools")
          ts_tools.setup({
            server = opts,
          })
          return true -- prevent lspconfig from setting tsserver again
        end,
      },
    },
  },

  ------------------------------------------------
  -- TypeScript Tools
  ------------------------------------------------
  {
    "pmizio/typescript-tools.nvim",
  },

  ------------------------------------------------
  -- Rust
  ------------------------------------------------
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

  ------------------------------------------------
  -- Tailwind
  ------------------------------------------------
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },

  ------------------------------------------------
  -- Markdown
  ------------------------------------------------
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
    },
    opts = {},
  },

  ------------------------------------------------
  -- Java (JDTLS)
  ------------------------------------------------
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local jdtls = require("jdtls")
      local root_dir = root_from_buf(0, { "gradlew", "pom.xml", ".git" }) or vim.loop.cwd()

      jdtls.start_or_attach({
        cmd = { "jdtls" },
        root_dir = root_dir,
        settings = {
          java = {
            completion = {
              favoriteStaticMembers = {
                "org.junit.jupiter.api.Assertions.*",
                "org.mockito.Mockito.*",
              },
            },
          },
        },
        on_attach = function(client)
          if client.server_capabilities.codeActionProvider then
            jdtls.setup_dap(client.env.data_dir .. "/java-debug-adapter", {})
          end
        end,
      })
    end,
  },
}
