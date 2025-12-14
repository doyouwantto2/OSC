local lspconfig = require("lspconfig")
local keymap = vim.keymap.set
local fs = vim.fs

-- Function to set common keymaps on LSP attach
local ts_on_attach = function(client, bufnr)
  -- Disable default formatter for tsserver since you are using conform or another tool
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

-- Standard root finding function using native Neovim API
local get_common_root = function(bufnr)
  return fs.root(bufnr, { ".git", "package.json" })
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --Lua language server
        lua_ls = {
          cmd = { "lua-language-server" },
        },
        -- Base LSPs
        html = { cmd = { "vscode-html-language-server", "--stdio" } },
        cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
        jsonls = { cmd = { "vscode-json-language-server", "--stdio" } },

        -- TypeScript/JavaScript
        tsserver = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          root_dir = function(fname)
            return fs.root(fname, { ".git", "package.json", "tsconfig.json" })
          end,
          on_attach = ts_on_attach,
        },

        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
              },
            },
          },
        },

        -- C/C++
        ccls = {
          cmd = { "ccls" },
          init_options = {
            cache = { directory = ".ccls-cache" },
            compilationDatabaseDirectory = "build",
          },
        },

        -- Astro
        astro = {
          cmd = { "astro-ls", "--stdio" },
          filetypes = { "astro" },
          root_dir = function(fname)
            return fs.root(fname, { "astro.config.mjs", "astro.config.ts", "package.json", "tsconfig.json", ".git" })
          end,
        },

        -- Vue (Volar)
        volar = {
          cmd = { "vue-language-server", "--stdio" },
          filetypes = { "vue" },
          root_dir = function(fname)
            return fs.root(fname, {
              "package.json",
              "vue.config.js",
              "vite.config.ts",
              "vite.config.js",
              ".git",
            })
          end,
          init_options = {
            vue = { hybridMode = false },
            typescript = {
              tsdk = vim.fn.system("dirname $(dirname $(readlink -f $(which tsc)))"):gsub("%s+", "") .. "/lib",
            },
          },
        },

        -- Nix
        nixd = {
          cmd = { "nixd" },
          settings = {
            nixd = { formatting = { command = { "nixpkgs-fmt" } } },
          },
        },
      },

      setup = {
        tsserver = function(_, opts)
          local ts_tools = require("typescript-tools")
          ts_tools.setup({ server = opts })
          return true
        end,
      },
    },
  },

  { "pmizio/typescript-tools.nvim" },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, -- Load immediately for Rust files
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

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

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    opts = {},
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local jdtls = require("jdtls")
      local root_markers = { "gradlew", "pom.xml", ".git" }

      local root_dir = fs.root(0, root_markers) or os.getenv("HOME")

      local config = {
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
        on_attach = function(client, bufnr)
          if client.server_capabilities.codeActionProvider then
            jdtls.setup_dap(client.env.data_dir .. "/java-debug-adapter", {})
          end
        end,
      }

      jdtls.start_or_attach(config)
    end,
  },
}
