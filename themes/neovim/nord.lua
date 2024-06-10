return {
	{ "shaunsingh/nord.nvim" },
	{
		"lazyvim/lazyvim",
		opts = {
			colorscheme = "nord",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
