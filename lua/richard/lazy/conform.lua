
return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
		python = { "ruff" },
		go = { "gofmt" },
		html = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
            }
        })
    end
}
