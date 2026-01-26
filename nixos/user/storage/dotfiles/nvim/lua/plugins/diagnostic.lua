return {
  { "MunifTanjim/nui.nvim" },
  { "nvim-neotest/nvim-nio" },

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
    "rcarriga/nvim-dap-ui",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
    },
    opts = function(_, opts)
      local clangd_scores = require("clangd_extensions.cmp_scores")

      opts.sources = {
        { name = "nvim_lsp" }, -- 🔴 REQUIRED
        { name = "luasnip" },
        { name = "emoji" },
      }

      opts.sorting = opts.sorting or {}
      opts.sorting.comparators = opts.sorting.comparators or {}
      table.insert(opts.sorting.comparators, 1, clangd_scores)
    end,
  },

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {},
  },
}
