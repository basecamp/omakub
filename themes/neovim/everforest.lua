return {
	{ "neanias/everforest-nvim" },
	{
		"lazyvim/lazyvim",
		opts = {
			colorscheme = "everforest",
			background = "soft",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
