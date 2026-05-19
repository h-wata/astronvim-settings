-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        -- add more arguments for adding more language servers
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "stylua",
        "prettier",
        "clangd",
        "isort",
        "yapf",
        "ruff",
        "tidy",
        "xmllint",
        "remark-cli",
        "cmake_format",
        "clang_format",
        "cmake_lint",
        -- add more arguments for adding more null-ls sources
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>lv"] = { "<Cmd>VenvSelect<CR>", desc = "Select VirtualEnv" },
            },
          },
        },
      },
    },
    opts = {},
    cmd = "VenvSelect",
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python", -- NOTE: ft: lazy-load on filetype
    config = function(_, opts)
      local path = vim.fn.exepath "python"
      local ok, debugpy = pcall(require("mason-registry").get_package, "debugpy")
      if ok and debugpy:is_installed() then
        local InstallLocation = require "mason-core.installer.InstallLocation"
        local install_path = InstallLocation.global():package("debugpy")
        if vim.fn.has "win32" == 1 then
          path = install_path .. "/venv/Scripts/python"
        else
          path = install_path .. "/venv/bin/python"
        end
      end
      require("dap-python").setup(path, opts)
    end,
  },
}
