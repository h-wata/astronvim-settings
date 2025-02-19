-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local home = os.getenv "HOME"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      require("none-ls.diagnostics.ruff").with {
        extra_args = { "--config=" .. home .. "/work/.github/pyproject.toml" },
      },
      -- require "none-ls.formatting.ruff",
      -- Set a diagnostic
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.cmake_lint,
      -- Set a formatter
      null_ls.builtins.formatting.remark,
      null_ls.builtins.formatting.yapf.with {
        extra_args = { "--style=" .. home .. "/work/.github/pyproject.toml" },
      },
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.cmake_format,
      null_ls.builtins.formatting.clang_format,
      null_ls.builtins.formatting.isort,
    }
    return config -- return final config table
  end,
}
