return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          return require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "cpp",
        "c",
        "rust",
        "sql",
        "graphql",
        "astro",
        "css",
        "scss",
        "latex",
        "astro",
        "solidity",
      },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
      local dap = require("dap")
      local utils = require("dap.utils")
      local keymap = vim.keymap.set

      local adapter_name = "codelldb"

      if not dap.adapters[adapter_name] then
        dap.adapters[adapter_name] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            -- Retaining the fix for NixOS/PATH issues
            command = "bash",
            args = { "-c", "codelldb --port ${port}" },
          },
        }
      end

      local cc_config = {
        {
          type = adapter_name,
          request = "launch",
          name = "Launch file",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
        },
        {
          type = adapter_name,
          request = "attach",
          name = "Attach to process",
          pid = utils.pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.c = cc_config
      dap.configurations.cpp = cc_config

      keymap({ "n", "v" }, "<Leader>B", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      keymap("n", "<Leader>C", dap.continue, { desc = "DAP Continue" })
      keymap("n", "<Leader>S", dap.step_over, { desc = "DAP Step Over" })
      keymap("n", "<Leader>s", dap.step_into, { desc = "DAP Step Into" })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        direction = "float",
        shell = "fish",
        open_mapping = "<M-\\>",
        float_opts = {
          border = "curved",
          width = function()
            return math.floor(vim.o.columns - 4)
          end,
          height = function()
            return math.floor(vim.o.lines - 4)
          end,
          winblend = 0,
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      vim.keymap.set("n", "<Leader>gl", function()
        lazygit:toggle()
      end, { desc = "Toggle LazyGit Terminal" })
    end,
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,

      cursor_color = "#f5f5f5",
      stiffness = 0.6,
      trailing_stiffness = 0.5,
      damping = 0.6,
      trailing_exponent = 5,
      never_draw_over_target = true,
      hide_target_hack = true,
      gamma = 1,
    },
  },

  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall",
    config = function()
      local live_server = require("live-server-nvim")
      live_server.setup({
        custom = {
          "--port=8080",
          "--no-css-inject",
        },
        serverPath = vim.fn.stdpath("data") .. "/live-server/",
        open = "folder",
      })
    end,
  },
}
