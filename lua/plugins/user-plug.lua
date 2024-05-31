return {
  {
    "NeogitOrg/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
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
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = false,
      },
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
}
