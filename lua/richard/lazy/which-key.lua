return {
	"folke/which-key.nvim",
	opts = {
		delay = 300, -- Delay before showing which-key (milliseconds)
		preset = "modern", -- Use modern preset for better performance
		spec = {
			-- Visual mode selections
			{ "<BS>", desc = "Decrement Selection", mode = "x" },
			{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },

			-- Leader key groups with descriptions
			{ "<leader>p", group = "Project", desc = "Project Operations" },
			{ "<leader>f", group = "Find", desc = "Find Operations" },
			{ "<leader>s", group = "Search", desc = "Search Operations" },
			{ "<leader>g", group = "Git", desc = "Git Operations" },
			{ "<leader>u", group = "Utility", desc = "Utility & Toggles" },
			{ "<leader>v", group = "View/LSP", desc = "View & LSP Operations" },
			{ "<leader>b", group = "Buffer", desc = "Buffer Management" },
			{ "<leader>w", group = "Window", desc = "Window Management" },
			{ "<leader>t", group = "Terminal", desc = "Terminal Operations" },
			{ "<leader>q", group = "Quit", desc = "Quit Operations" },

			-- Harpoon group
			{ "<leader>1", hidden = true, icon = "󱡀" },
			{ "<leader>2", hidden = true, icon = "󱡀" },
			{ "<leader>3", hidden = true, icon = "󱡀" },
			{ "<leader>4", hidden = true, icon = "󱡀" },

			-- Core single key operations
			{ "<leader>a", desc = "Harpoon Add", icon = "⚓" },
			{ "<leader>e", desc = "Toggle File Explorer" },
			{ "<leader>/", desc = "Live Grep Search" },

			-- Diagnostic navigation
			{ "[d", desc = "Previous Diagnostic" },
			{ "]d", desc = "Next Diagnostic" },

			-- LSP operations
			{ "gd", desc = "Go to Definition" },
			{ "K", desc = "Hover Documentation" },
			{ "gu", desc = "Diff Get Left (merge)" },
			{ "gh", desc = "Diff Get Right (merge)" },
		},
	},
}
