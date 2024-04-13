local utils = require "astrocore"
return {
  {
    "TimUntersberger/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
        commit_editor = {
          kind = "split",
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function(_, opts)
      return utils.extend_tbl(opts, {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        messages = {
          enabled = false, -- enables the Noice messages UI
        },
      })
    end,
    init = function() vim.g.lsp_handlers_enabled = false end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "*",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "live_grep_args" end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    version = "*",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "file_browser" end,
  },
}
