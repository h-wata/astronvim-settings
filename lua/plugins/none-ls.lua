-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local home = os.getenv "HOME"
    local work_github = home .. "/work/.github"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Python linting and formatting
      require("none-ls.diagnostics.ruff").with {
        extra_args = { "--config=" .. work_github .. "/pyproject.toml" },
      },
      null_ls.builtins.formatting.yapf.with {
        extra_args = { "--style=" .. work_github .. "/pyproject.toml" },
      },
      null_ls.builtins.formatting.isort.with {
        extra_args = { "--sp", work_github .. "/pyproject.toml", "--src", "." },
      },

      -- C/C++ formatting
      null_ls.builtins.formatting.clang_format.with {
        extra_args = { "-style=file:" .. work_github .. "/ros2/.clang-format" },
      },

      -- CMake formatting and linting
      null_ls.builtins.formatting.cmake_format.with {
        extra_args = { "-c", work_github .. "/ros2/.cmake-format" },
      },
      null_ls.builtins.diagnostics.cmake_lint,

      -- YAML formatting and linting
      null_ls.builtins.diagnostics.yamllint.with {
        extra_args = { "-s", "-c", work_github .. "/.yamllint" },
      },

      -- XML formatting
      null_ls.builtins.formatting.xmllint.with {
        filetypes = { "xml", "launch", "xacro", "urdf" },
        extra_args = { "--format", "--nsclean", "--noblanks" },
      },

      -- Other formatters and linters
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.formatting.remark,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}
