return {
	"lambdalisue/fern.vim",
	enabled = false,
	config = function()
		-- Disable netrw in favor of Fern
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		
		-- Fern settings
		vim.g["fern#default_hidden"] = 1
		vim.g["fern#drawer_width"] = 30
		vim.g["fern#disable_drawer_auto_quit"] = 1
		
		-- Custom keymaps for Fern buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fern",
			callback = function()
				local opts = { buffer = true, silent = true }
				-- Basic navigation
				vim.keymap.set("n", "o", "<Plug>(fern-action-open-or-expand)", opts)
				vim.keymap.set("n", "<CR>", "<Plug>(fern-action-open-or-expand)", opts)
				vim.keymap.set("n", "s", "<Plug>(fern-action-open:split)", opts)
				vim.keymap.set("n", "v", "<Plug>(fern-action-open:vsplit)", opts)
				vim.keymap.set("n", "t", "<Plug>(fern-action-open:tabedit)", opts)
				
				-- File operations
				vim.keymap.set("n", "N", "<Plug>(fern-action-new-file)", opts)
				vim.keymap.set("n", "K", "<Plug>(fern-action-new-dir)", opts)
				vim.keymap.set("n", "D", "<Plug>(fern-action-remove)", opts)
				vim.keymap.set("n", "R", "<Plug>(fern-action-rename)", opts)
				vim.keymap.set("n", "C", "<Plug>(fern-action-copy)", opts)
				vim.keymap.set("n", "M", "<Plug>(fern-action-move)", opts)
				
				-- Toggle operations
				vim.keymap.set("n", "H", "<Plug>(fern-action-hidden:toggle)", opts)
				vim.keymap.set("n", "r", "<Plug>(fern-action-reload)", opts)
				
				-- Close drawer
				vim.keymap.set("n", "q", ":q<CR>", opts)
			end,
		})
	end,
}
