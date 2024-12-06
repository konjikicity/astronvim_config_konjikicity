return {
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
    presets = {
      command_palette = true, -- コマンドパレットを有効化
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%", -- 画面の縦方向中央
          col = "50%", -- 画面の横方向中央
        },
        size = {
          width = "auto",
          height = "auto",
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
