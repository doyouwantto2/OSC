return {

	{
		"tribela/transparent.nvim",
		event = "VimEnter",
		config = true,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"olivercederborg/poimandres.nvim",
		transparent = true,
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			vim.cmd("colorscheme poimandres")
		end,
	},

	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000, -- ensure it loads before other plugins
		config = function()
			local everforest = require("everforest")
			everforest.setup({
				background = "medium",
				transparent_background_level = 0,
				italics = true,
				disable_italic_comments = false,
				on_highlights = function(hl, _)
					hl["@string.special.symbol.ruby"] = { link = "@field" }
				end,
			})
		end,
	},

	{
		"shaunsingh/nord.nvim",
		priority = 1000, -- Load the colorscheme before other plugins
		lazy = false, -- Load during startup
		config = function()
			-- Optional: Configure Nord settings here
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = true
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- load first
		lazy = false, -- load during startup, not on demand
		config = function()
			require("kanagawa").setup({
				compile = false, -- don’t compile theme for performance
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- no transparent background
				dimInactive = false, -- no dimming for inactive windows
				terminalColors = true, -- use terminal theme colors
				theme = "default", -- choose: 'default', 'wave', 'dragon', or 'lotus'
				overrides = function(colors)
					return {}
				end,
				background = {
					dark = "dragon", -- use 'dragon' theme in dark mode
					light = "lotus", -- use 'lotus' theme in light mode
				},
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Load the colorscheme before other plugins
		lazy = false, -- Load during startup
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- Options: "latte", "frappe", "macchiato", "mocha"
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				show_end_of_buffer = false, -- Show '~' characters after the end of buffers
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false,
				no_bold = false,
				no_underline = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
		end,
	},

	{
		"everviolet/nvim",
		name = "evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			theme = {
				variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
				accent = "green",
			},
			editor = {
				transparent_background = false,
				sign = { color = "none" },
				float = {
					color = "mantle",
					invert_border = false,
				},
				completion = {
					color = "surface0",
				},
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "everforest",
		},
	},
}
