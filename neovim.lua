return {
	{
		"bjarneo/aether.nvim",
		name = "aether",
		priority = 1000,
		opts = {
			disable_italics = false,
			colors = {
				-- Monotone shades (base00-base07)
				base00 = "#0a0a0a", -- Default background
				base01 = "#2f4f4f", -- Lighter background (status bars)
				base02 = "#0a0a0a", -- Selection background
				base03 = "#4f6a6a", -- Comments, invisibles
				base04 = "#777696", -- Dark foreground
				base05 = "#fff5ee", -- Default foreground
				base06 = "#b8ffff", -- Light foreground
				base07 = "#777696", -- Light background

				-- Accent colors (base08-base0F)
				base08 = "#d35f5f", -- Variables, errors, red
				base09 = "#ff631c", -- Integers, constants, orange
				base0A = "#485362", -- Classes, types, yellow
				base0B = "#adf0e9", -- Strings, green
				base0C = "#88ece7", -- Support, regex, cyan
				base0D = "#a9d1d7", -- Functions, keywords, blue
				base0E = "#818893", -- Keywords, storage, magenta
				base0F = "#008080", -- Deprecated, brown/yellow
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
