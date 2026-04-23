return {
  {
    "bjarneo/aether.nvim",
    branch = "v2",
    name = "aether",
    priority = 1000,
    opts = {
      transparent = false,
      colors = {
        -- Background colors
        bg = "#0a0a0a",
        bg_dark = "#0a0a0a",
        bg_highlight = "#4b4b4b",

        -- Foreground colors
        fg = "#c4d8e2",
        fg_dark = "#d2d9db",

        -- comment: Line highlight, gutter elements, disabled states
        comment = "#322F3B",

        -- Accent colors
        red = "#D35F5F",
        orange = "#eb7087",
        yellow = "#75b4be",
        green = "#8FECD5",
        cyan = "#5a676b",
        blue = "#ADF0E9",
        purple = "#9f6cdd",
        magenta = "#485362",
      },
      on_highlights = function(hl, c)
                -- If it's "too dark", use a lighter grey like #2a2a2a
                hl.CursorLine = { bg = "#161616" } 
                hl.CursorLineNr = { fg = c.orange, bold = true }
            end,
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      -- Enable hot reload
      require("aether.hotreload").setup()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}