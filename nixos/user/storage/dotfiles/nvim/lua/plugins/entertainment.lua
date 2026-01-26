return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {},
  },

  {
    "tamton-aquib/duck.nvim",
    lazy = false,

    config = function(_, opts)
      local duck = require("duck")

      duck.setup(opts)

      vim.api.nvim_create_user_command("Hatch", function()
        local i = 1
        while i <= 5 do
          duck.hatch("🐧", 10)
          i = i + 1
        end
      end, {
        nargs = 0,
        desc = "Hatch: Spawn a penguin",
      })

      vim.api.nvim_create_user_command("Cook", function()
        duck.cook_all()
      end, {
        nargs = 0,
        desc = "Cook: Delete all penguins",
      })
    end,
  },
}
