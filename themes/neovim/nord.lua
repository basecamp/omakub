return {
	{ "shaunsingh/nord.nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "nord",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
