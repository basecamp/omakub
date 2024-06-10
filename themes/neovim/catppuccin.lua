return {
	{
		"catppuccin",
		opts = {
			transparent_background = true,
		},
		config = require('plugins.commons').set_transparent_bg()
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
