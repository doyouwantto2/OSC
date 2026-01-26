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
        -- TypeScript (delegated)
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
        },

        ------------------------------------------------
        -- C / C++
        ------------------------------------------------
        ccls = {
          cmd = { "ccls" },
          capabilities = capabilities,
        },

        ------------------------------------------------
        -- Astro
        ------------------------------------------------
        astro = {
          cmd = { "astro-ls", "--stdio" },
          filetypes = { "astro" },
          capabilities = capabilities,
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
                command = { "nixfmt" },
              },
            },
          },
        },

        dockerls = {
          cmd = { "docker-language-server", "start", "--stdio" },
          filetypes = { "dockerfile", "Dockerfile" },
          root_dir = require("lspconfig.util").root_pattern(
            "Dockerfile",
            "docker-compose.yml",
            "docker-compose.yaml",
            ".git"
          ),
          single_file_support = true,
          capabilities = capabilities,
        },

        yamlls = {
          cmd = { "yaml-language-server", "--stdio" },
          filetypes = { "yaml", "yml" },
          root_dir = require("lspconfig.util").root_pattern("docker-compose.yml", "docker-compose.yaml", ".git"),
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                  "docker-compose.yml",
                  "docker-compose.yaml",
                },
              },
              validate = true,
              completion = true,
              hover = true,
            },
          },
          capabilities = capabilities,
        },
      },

      ------------------------------------------------
      -- typescript-tools integration
      ------------------------------------------------
      setup = {
        tsserver = function(_, opts)
          require("typescript-tools").setup({ server = opts })
          return true
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
