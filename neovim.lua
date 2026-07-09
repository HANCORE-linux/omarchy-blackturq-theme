return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      transparent = false,
      colors = {
        bg         = "#0a0a0a",
        dark_bg    = "#0a0a0a",
        darker_bg  = "#050807",
        lighter_bg = "#14201e",
        selection  = "#182826",

        fg         = "#c8dcdc",
        dark_fg    = "#aabab6",
        bright_fg  = "#e4f2f0",
        muted      = "#6e8e8c",

        red        = "#d35f5f",
        orange     = "#ff8a4d",
        yellow     = "#ffd84a",
        green      = "#8fecd5",
        cyan       = "#63c9c4",
        blue       = "#adf0e9",
        purple     = "#ff3d7f",
        brown      = "#7fa8a0",

        bright_red    = "#ff6a6a",
        bright_yellow = "#a9b673",
        bright_green  = "#b4f5e4",
        bright_cyan   = "#8fe0dc",
        bright_blue   = "#cbf6f2",
        bright_purple = "#c58af5",
      },
      on_highlights = function(hl, c)
        hl.CursorLine = { bg = c.lighter_bg }
        hl.CursorLineNr = { fg = c.yellow, bold = true }
        hl.LspReferenceText = { bg = c.selection, fg = c.bright_fg }
        hl.LspReferenceRead = hl.LspReferenceText
        hl.LspReferenceWrite = hl.LspReferenceText
        hl.SnacksPickerDir         = { fg = c.muted }
        hl.SnacksPickerPathHidden  = { fg = c.muted }
        hl.SnacksPickerPathIgnored = { fg = c.muted }
        hl.SnacksPickerListCursorLine = { bg = c.lighter_bg }
      end,
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
