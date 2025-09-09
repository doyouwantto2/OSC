return {
  "tamton-aquib/duck.nvim",
  event = "VeryLazy",
  config = function()
    local duck = require("duck")

    -- Expanded list of animals
    local animals = {
      "🐧",
      -- Add more emojis here
    }

    -- Command to hatch a random animal
    vim.api.nvim_create_user_command("DuckHatch", function()
      local selected = animals[math.random(#animals)]
      duck.hatch(selected)
      print("Hatched a " .. selected)
    end, {})

    -- Command to remove all hatched ducks
    vim.api.nvim_create_user_command("DuckCook", function()
      duck.cook() -- remove all ducks
      print("All ducks removed!")
    end, {})
  end,
}
