return {
	{ "rebelot/kanagawa.nvim" },
	{
		"lazyvim/lazyvim",
		opts = {
			colorscheme = "kanagawa",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
