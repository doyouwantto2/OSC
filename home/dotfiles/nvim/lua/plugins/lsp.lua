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

	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				-- For all servers
				["*"] = function(_, _)
					vim.api.nvim_create_autocmd("LspAttach", {
						callback = function(args)
							local client = vim.lsp.get_client_by_id(args.data.client_id)
							if client then
								client.server_capabilities.semanticTokensProvider = nil
							end
						end,
					})
					return false
				end,
			},
		},
	},
}
