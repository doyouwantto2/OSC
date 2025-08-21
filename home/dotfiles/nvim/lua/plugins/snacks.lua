return {
	"snacks.nvim",
	opts = {
		image = {
			enable = true,
		},
		dashboard = {
			preset = {
				pick = function(cmd, opts)
					return LazyVim.pick(cmd, opts)()
				end,
				header = [[
        

  _____               _                   ____    _  _      __     _____ 
 | ____|  _ __ ___   (_)  _   _    __ _  |___ \  | || |    / /_   |___  |
 |  _|   | '_ ` _ \  | | | | | |  / _` |   __) | | || |_  | '_ \     / / 
 | |___  | | | | | | | | | |_| | | (_| |  / __/  |__   _| | (_) |   / /  
 |_____| |_| |_| |_| |_|  \__, |  \__,_| |_____|    |_|    \___/   /_/   
                          |___/                                          


        ]],
				---@type snacks.dashboard.Item[]
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function()
							Snacks.dashboard.pick("files")
						end,
					},
					{
						icon = " ",
						key = "n",
						desc = "New File",
						action = function()
							vim.cmd("ene | startinsert")
						end,
					},
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = function()
							Snacks.dashboard.pick("live_grep")
						end,
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = function()
							Snacks.dashboard.pick("oldfiles")
						end,
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = function()
							Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
						end,
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = " ",
						key = "x",
						desc = "Lazy Extras",
						action = function()
							vim.cmd("LazyExtras")
						end,
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = function()
							vim.cmd("Lazy")
						end,
					},
					{
						icon = " ",
						key = "q",
						desc = "Quit",
						action = function()
							vim.cmd("qa")
						end,
					},
				},
			},
		},
	},
}
