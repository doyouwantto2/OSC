local util = require("lspconfig.util")
local capabilities = require("blink.cmp").get_lsp_capabilities()

--------------------------------------------------
-- Keymaps
--------------------------------------------------
local on_attach = function(_, bufnr)
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

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
-- Helpers
--------------------------------------------------

-- Find an executable in the project's node_modules/.bin.
local function project_bin(root_dir, name)
  if not root_dir then
    return nil
  end

  local path = vim.fs.joinpath(root_dir, "node_modules", ".bin", name)

  if vim.fn.executable(path) == 1 then
    return path
  end

  return nil
end

-- Find a package inside the project's node_modules.
local function project_package(root_dir, package)
  if not root_dir then
    return nil
  end

  local path = vim.fs.joinpath(root_dir, "node_modules", package)

  if vim.fn.isdirectory(path) == 1 then
    return path
  end

  return nil
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

    config = function()
      ------------------------------------------------
      -- Lua
      ------------------------------------------------
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- HTML
      ------------------------------------------------
      vim.lsp.config("html", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- CSS
      ------------------------------------------------
      vim.lsp.config("cssls", {
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
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- Python
      ------------------------------------------------
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- C / C++
      ------------------------------------------------
      vim.lsp.config("ccls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- Astro
      ------------------------------------------------
      vim.lsp.config("astro", {
        capabilities = capabilities,
        on_attach = on_attach,

        cmd = function(dispatchers, config)
          local root_dir = config.root_dir

          local local_cmd = project_bin(root_dir, "astro-ls")

          local cmd = local_cmd or "astro-ls"

          return vim.lsp.rpc.start({
            cmd,
            "--stdio",
          }, dispatchers)
        end,

        init_options = {
          typescript = {},
        },

        before_init = function(_, config)
          local root_dir = config.root_dir

          if not root_dir then
            return
          end

          local tsdk = vim.fs.joinpath(root_dir, "node_modules", "typescript", "lib")

          if vim.fn.isdirectory(tsdk) == 1 then
            config.init_options = config.init_options or {}
            config.init_options.typescript = config.init_options.typescript or {}

            config.init_options.typescript.tsdk = tsdk
          end
        end,
      })

      ------------------------------------------------
      -- TypeScript / Vue
      --
      -- Vue Language Tools 3.x uses hybrid mode:
      --
      -- vtsls
      --   ├── TypeScript / JavaScript
      --   └── @vue/typescript-plugin (Vue projects only)
      --
      -- vue_ls
      --   └── Vue template / CSS (Vue projects only)
      ------------------------------------------------

      local tsserver_filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
      }

      ------------------------------------------------
      -- VTSLS
      ------------------------------------------------

      vim.lsp.config("vtsls", {
        capabilities = capabilities,
        on_attach = on_attach,

        filetypes = tsserver_filetypes,

        root_markers = {
          "tsconfig.json",
          "jsconfig.json",
          "package.json",
          ".git",
        },

        cmd = function(dispatchers, config)
          local local_cmd = project_bin(config.root_dir, "vtsls")
          local cmd = local_cmd or "vtsls"

          return vim.lsp.rpc.start({
            cmd,
            "--stdio",
          }, dispatchers)
        end,

        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {},
            },
          },
        },

        before_init = function(_, config)
          local root_dir = config.root_dir

          if not root_dir then
            return
          end

          ------------------------------------------------
          -- Only enable Vue TypeScript plugin when this
          -- project actually contains @vue/language-server.
          ------------------------------------------------

          local vue_language_server_path = project_package(root_dir, "@vue/language-server")

          -- Normal TypeScript / JavaScript project.
          --
          -- Do NOT show an error or warning.
          if not vue_language_server_path then
            return
          end

          ------------------------------------------------
          -- Vue project
          ------------------------------------------------

          config.settings = config.settings or {}
          config.settings.vtsls = config.settings.vtsls or {}
          config.settings.vtsls.tsserver = config.settings.vtsls.tsserver or {}

          config.settings.vtsls.tsserver.globalPlugins = {
            {
              name = "@vue/typescript-plugin",

              location = vue_language_server_path,

              languages = {
                "vue",
              },

              configNamespace = "typescript",

              enableForWorkspaceTypeScriptVersions = true,
            },
          }
        end,
      })

      ------------------------------------------------
      -- Vue Language Server
      ------------------------------------------------

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
        on_attach = on_attach,

        cmd = function(dispatchers, config)
          local local_cmd = project_bin(config.root_dir, "vue-language-server")

          local cmd = local_cmd or "vue-language-server"

          return vim.lsp.rpc.start({
            cmd,
            "--stdio",
          }, dispatchers)
        end,

        filetypes = {
          "vue",
        },

        root_markers = {
          "package.json",
          "nuxt.config.ts",
          "nuxt.config.js",
          "nuxt.config.mjs",
          "vite.config.ts",
          "vite.config.js",
          ".git",
        },

        before_init = function(_, config)
          local root_dir = config.root_dir

          if not root_dir then
            return
          end

          ------------------------------------------------
          -- Only allow vue_ls when Vue Language Server
          -- actually exists in this project.
          ------------------------------------------------

          local vue_language_server_path = project_package(root_dir, "@vue/language-server")

          if not vue_language_server_path then
            -- Silently skip.
            return
          end
        end,
      })

      ------------------------------------------------
      -- Nix
      ------------------------------------------------
      vim.lsp.config("nixd", {
        capabilities = capabilities,
        on_attach = on_attach,

        settings = {
          nixd = {
            formatting = {
              command = {
                "nixfmt",
              },
            },
          },
        },
      })

      ------------------------------------------------
      -- Docker
      ------------------------------------------------
      vim.lsp.config("dockerls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- YAML
      ------------------------------------------------
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- Ruby
      ------------------------------------------------
      vim.lsp.config("ruby_lsp", {
        capabilities = capabilities,
        on_attach = on_attach,

        root_dir = util.root_pattern("Gemfile", ".git"),
      })

      ------------------------------------------------
      -- LaTeX
      ------------------------------------------------
      vim.lsp.config("texlab", {
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
      vim.lsp.config("tinymist", {
        cmd = {
          "tinymist",
        },

        filetypes = {
          "typst",
        },

        root_markers = {
          "typst.toml",
          ".git",
        },

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
      -- Markdown
      ------------------------------------------------
      vim.lsp.config("marksman", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ------------------------------------------------
      -- Tailwind CSS
      ------------------------------------------------
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        on_attach = on_attach,

        filetypes = {
          "html",
          "css",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "astro",
          "solid",
        },

        root_markers = {
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts",
          "package.json",
          ".git",
        },
      })

      ------------------------------------------------
      -- Enable LSPs
      ------------------------------------------------
      vim.lsp.enable({
        "lua_ls",
        "html",
        "cssls",
        "jsonls",
        "pyright",
        "ccls",
        "astro",
        "vtsls",
        "vue_ls",
        "nixd",
        "dockerls",
        "yamlls",
        "ruby_lsp",
        "texlab",
        "tinymist",
        "marksman",
        "tailwindcss",
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
  -- Tailwind Tools
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
  -- Typst Preview
  ------------------------------------------------
  {
    "chomosuke/typst-preview.nvim",

    ft = "typst",

    version = "1.*",

    opts = {},
  },

  ------------------------------------------------
  -- Render Markdown
  ------------------------------------------------
  {
    "MeanderingProgrammer/render-markdown.nvim",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },

    opts = {},
  },

  ------------------------------------------------
  -- Diagram
  ------------------------------------------------
  {
    "3rd/diagram.nvim",

    dependencies = {
      {
        "3rd/image.nvim",
        opts = {},
      },
    },

    opts = {
      events = {
        render_buffer = {
          "InsertLeave",
          "BufWinEnter",
          "TextChanged",
        },

        clear_buffer = {
          "BufLeave",
        },
      },

      renderer_options = {
        mermaid = {
          background = nil,
          theme = nil,
          scale = 1,
          width = nil,
          height = nil,
          cli_args = nil,
        },

        plantuml = {
          charset = nil,
          cli_args = nil,
        },

        d2 = {
          theme_id = nil,
          dark_theme_id = nil,
          scale = nil,
          layout = nil,
          sketch = nil,
          cli_args = nil,
        },

        gnuplot = {
          size = nil,
          font = nil,
          theme = nil,
          cli_args = nil,
        },
      },
    },
  },
}
