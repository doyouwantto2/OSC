local lspconfig = require("lspconfig")

-- Register HTMLHint as a custom LSP server
lspconfig.htmlhint_ls = {
  default_config = {
    cmd = { "htmlhint-ls", "--stdio" }, -- make sure htmlhint-language-server is in PATH
    filetypes = { "html" },
    root_dir = lspconfig.util.root_pattern(".git", "package.json"),
    settings = {},
  },
}

-- Register CSSLint as a custom LSP server
lspconfig.csslint_ls = {
  default_config = {
    cmd = { "csslint", "--stdio" }, -- make sure csslint is in PATH
    filetypes = { "css" },
    root_dir = lspconfig.util.root_pattern(".git", "package.json"),
    settings = {},
  },
}

return {
  -- change trouble config
  {
    "dgagn/diagflow.nvim",
    -- event = 'LspAttach', This is what I use personnally and it works great
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.sorting = opts.sorting or {}
      opts.sorting.comparators = opts.sorting.comparators or {}
      table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
    end,
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "mason-org/mason.nvim",
      optional = true,
      opts = { ensure_installed = { "codelldb" } },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },

  { "williamboman/mason.nvim",                   enabled = false },
  { "williamboman/mason-lspconfig.nvim",         enabled = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },

  -- LSP setup
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Nix
        nixd = {
          cmd = { "nixd" },
          settings = {
            nixd = {
              formatting = { command = { "nixpkgs-fmt" } },
            },
          },
        },

        -- TS/JS (both modern and legacy LS)
        tsserver = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = {
            "javascript",      -- .js
            "javascriptreact", -- .jsx
            "typescript",      -- .ts
            "typescriptreact", -- .tsx
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "tsconfig.json",
              "package.json",
              "jsconfig.json",
              ".git"
            )(fname)
          end,
          init_options = {
            hostInfo = "neovim",
          },
          on_attach = function(client, bufnr)
            -- Disable formatting to avoid conflicts with Prettier/null-ls
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            -- Optional keymaps for React dev
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          end,
        },

        html = {
          cmd = { "vscode-html-language-server", "--stdio" },
        },

        cssls = {
          cmd = { "vscode-css-language-server", "--stdio" },
        },

        jsonls = {
          cmd = { "vscode-json-language-server", "--stdio" },
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

        ccls = {
          cmd = { "ccls" }, -- ccls must be in PATH (from nixpkgs)
          init_options = {
            cache = {
              directory = ".ccls-cache",
            },
            compilationDatabaseDirectory = "build", -- if you use compile_commands.json
          },
        },

        sqls = {
          cmd = { "sqls" }, -- must be installed
          on_attach = function(client, bufnr)
            -- Enable formatting from sqls
            client.server_capabilities.documentFormattingProvider = true

            -- Optional: keymaps
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          end,
        },
      },

    },
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

}
