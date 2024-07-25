-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- colorscheme
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.pack.blade" },
}
