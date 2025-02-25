-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true,                                 -- enable autopairs at start
      cmp = true,                                       -- enable completion at start
      diagnostics_mode = 3,                             -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true,                              -- highlight URLs at start
      notifications = true,                             -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = {                            -- vim.opt.<key>
        relativenumber = false,          -- sets vim.opt.relativenumber
        number = true,                   -- sets vim.opt.number
        spell = false,                   -- sets vim.opt.spell
        signcolumn = "auto",             -- sets vim.opt.signcolumn to auto
        wrap = false,                    -- sets vim.opt.wrap
        shiftwidth = 2,                  -- sets vim.opt.shiftwidth
        tabstop = 2,                     -- sets vim.opt.tabstop
      },
      g = {                              -- vim.g.<key>
        mapleader = " ",                 -- sets vim.g.mapleader
        autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true,              -- enable completion at start
        autopairs_enabled = true,        -- enable autopairs at start
        diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = false,       -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },

        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- move buffer
        ["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
        ["<S-h>"] = { "<cmd>bprev<cr>", desc = "Prev Buffer" },

        -- terminal
        ["<leader>i"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
      },
      t = {},

      -- line code up down
      v = {
        ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
        ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
      },
    },
  },
}
