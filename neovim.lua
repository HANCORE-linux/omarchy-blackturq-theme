eturn {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#0a0a0a", -- Default background
                base01 = "#1A1A1A", -- Lighter background (status bars)
                base02 = "#322F3B", -- Selection background
                base03 = "#55615A", -- Comments, invisibles
                base04 = "#8FECD5", -- Dark foreground accent
                base05 = "#FFF5EE", -- Default foreground
                base06 = "#D5F2E8", -- Light foreground
                base07 = "#A9D1D7", -- Light background hint

                -- Accent colors (base08-base0F)
                base08 = "#D35F5F", -- Variables, errors, red
                base09 = "#C89B5D", -- Integers, constants, gold-bronze
                base0A = "#36BFBF", -- Classes, types, teal-turquoise
                base0B = "#ADF0E9", -- Strings, bright turquoise-cyan
                base0C = "#75DDDD", -- Support, regex, cyan-turquoise
                base0D = "#40E0D0", -- Functions, keywords, main turquoise accent
                base0E = "#8FECD5", -- Keywords, storage, soft mint
                base0F = "#485362", -- Deprecated, dark slate accent
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
