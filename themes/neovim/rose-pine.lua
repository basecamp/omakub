return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"lazyvim/lazyvim",
		opts = {
			colorscheme = "rose-pine-dawn",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
