return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup {
      copilot_model = "gpt-4o-copilot",
    }
  end,
  cmd = "Copilot",
  event = "User AstroFile",
  opts = { suggestion = { auto_trigger = true, debounce = 150 } },
}
