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
        bg_highlight = "#fc93e4",

        -- Foreground colors
        fg = "#646d7a",
        fg_dark = "#485362",

        -- comment: Line highlight, gutter elements, disabled states
        comment = "#322F3B",

        -- Accent colors
        red = "#D35F5F",
        orange = "#F6AE2C",
        yellow = "#75b4be",
        green = "#8FECD5",
        cyan = "#5a676b",
        blue = "#ADF0E9",
        purple = "#9f6cdd",
        magenta = "#485362",
      },
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