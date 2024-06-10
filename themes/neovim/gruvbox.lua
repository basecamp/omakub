return {
	{ "ellisonleao/gruvbox.nvim" },
	{
		"lazyvim/lazyvim",
		opts = {
			colorscheme = "gruvbox",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
