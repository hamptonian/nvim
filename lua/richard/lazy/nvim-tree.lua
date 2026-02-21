return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = {
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
		"NvimTreeCollapse",
		"NvimTreeRefresh",
	},
	init = function()
		-- Recommended by nvim-tree to avoid conflicts
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
