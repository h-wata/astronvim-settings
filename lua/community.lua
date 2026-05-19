-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.colorscheme.iceberg-vim" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.avante-nvim" },
  -- import/override with your plugins folder
  { import = "plugins.extra.log-highlight" },
  { import = "plugins.extra.clangd" },
  { import = "plugins.extra.log-highlights" },
}
