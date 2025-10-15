---@type LazySpec

local root_dir = require("lspconfig").util.root_pattern ".git"(vim.fn.getcwd())
local parent_dir = root_dir and vim.fn.fnamemodify(root_dir, ":h") or "build"
local ws_dir = parent_dir and vim.fn.fnamemodify(parent_dir, ":h") or "build"
local compile_commands_dir = ws_dir .. "/"
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        cmd = {
          -- see clangd --help-hidden
          "clangd",
          -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
          -- to add more checks, create .clang-tidy file in the root directory
          -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
          "--enable-config",
          "--clang-tidy",
          "--compile-commands-dir=" .. compile_commands_dir,
        },
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
  },
}
