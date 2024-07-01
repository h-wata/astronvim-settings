return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup {
        window = {
          layout = "float",
          relative = "cursor",
          width = 1,
          height = 0.4,
          row = 1,
        },
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN 上記のコードを日本語で説明してください",
          },
          Review = {
            prompt = "/COPILOT_REVIEW 選択したコードをレビューしてください。",
          },
          Tests = {
            prompt = "/COPILOT_TESTS カーソル上のコードの詳細な単体テスト関数を書いてください。",
          },
          Fix = {
            prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。",
          },
        },
      }
    end,
    -- opts = {
    --   debug = false, -- Enable debugging
    --   -- See Configuration section for rest
    -- },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
