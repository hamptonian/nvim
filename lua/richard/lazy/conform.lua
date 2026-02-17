return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				go = { "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				astro = { "prettier" },
				blade = { "blade-formatter" },
				php = { "pint" },
				yaml = { "yamlfmt" },
				sql = { "sql-formatter" },
			},
			formatters = {
				["sql-formatter"] = {
					command = "sql-formatter",
					args = { "--stdin-filepath", "$FILENAME" },
				},
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			format_after_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
