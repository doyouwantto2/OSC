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
        -- Rust (Dioxus)
        rust_analyzer = {
          cmd = { "rust-analyzer" },
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true, loadOutDirsFromCheck = true },
              checkOnSave = { command = "clippy" },
              procMacro = { enable = true },
            },
          },
        },

        -- Nix
        nixd = {
          cmd = { "nixd" },
          settings = {
            nixd = {
              formatting = { command = { "nixpkgs-fmt" } },
            },
          },
        },

        -- HTML (superhtml if installed, fallback html)
        superhtml = { cmd = { "superhtml-languageserver", "--stdio" } },
        html = {},

        -- CSS (use cssls for LSP features, csslint handled separately)
        cssls = {},

        -- TS/JS (both modern and legacy LS)
        tsserver = {},

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

      },
    },
  },

  -- Linters via nvim-lint
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        css = { "csslint" },
      }
      -- auto run on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
