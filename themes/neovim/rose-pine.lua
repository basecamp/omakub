return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine-dawn",
		},
		config = require('plugins.commons').set_transparent_bg()
	},
}
