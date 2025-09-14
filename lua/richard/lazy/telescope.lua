return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"debugloop/telescope-undo.nvim",
	},

	config = function()
		require("telescope").setup({
			defaults = {
				-- Performance and layout optimizations
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.45,
					},
					width = 0.90,
					height = 0.85,
				},

				-- File ignore patterns
				file_ignore_patterns = {
					"node_modules/",
					"%.git/",
					"%.DS_Store",
					"target/",
					"build/",
					"%.out",
					"%.class",
					"%.pdf",
					"%.mkv",
					"%.mp4",
					"%.zip",
				},

				-- Enhanced mappings
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<C-l>"] = "send_to_qflist",
						["<C-_>"] = "which_key",
					},
					n = {
						["q"] = "close",
						["<C-l>"] = "send_to_qflist",
					},
				},
			},

			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--no-ignore", "--glob", "!node_modules/**", "--glob", "!.venv/**" }
					end,
				},
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					mappings = {
						i = {
							["<C-d>"] = "delete_buffer",
						},
					},
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				undo = {
					use_delta = true,
					use_custom_command = nil,
					side_by_side = false,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.8,
					},
				},
			},
		})

		-- Load extensions
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("aerial")

		-- Note: Keybindings moved to remap.lua for better organization
	end,
}
