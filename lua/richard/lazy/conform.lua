
return {
    'stevearc/conform.nvim',
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
    end
}
