require("nvim-tree").setup {
	disable_netrw = true,
	view = {
		signcolumn = "no",
		width = {
			padding = 4
		}
	},
	renderer = {
		highlight_git = true,
		indent_width = 0,
		indent_markers = {
			inline_arrows = false,
			enable = true
		}
	}
}
