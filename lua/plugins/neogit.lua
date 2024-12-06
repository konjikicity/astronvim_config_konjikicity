return {
  "NeogitOrg/neogit",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",
  },
  config = function()
    require("neogit").setup {
      integrations = {
        fzf_lua = true,
        telescope = true,
        diffview = true,
      },
      commit_editor = {
        kind = "split",
        show_staged_diff = false,
      },
    }
  end,
}
