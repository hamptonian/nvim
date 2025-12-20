return {
	"zapling/mason-conform.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"stevearc/conform.nvim",
	},
	config = function()
		require("mason-conform").setup()
	end,
}
