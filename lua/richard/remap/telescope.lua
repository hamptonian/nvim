-- Telescope keymaps - all file/content discovery operations
local builtin = require("telescope.builtin")

-- ============================================================================
-- PROJECT OPERATIONS (<leader>p*) - ThePrimeagen Style
-- ============================================================================

-- Keep existing ThePrimeagen keybindings for backward compatibility
vim.keymap.set("n", "<leader>pv", ":Fern . -drawer -toggle<CR>", { desc = "Project View (File Explorer)" })
vim.keymap.set("n", "<leader>pf", ":Fern . -drawer -toggle<CR>", { desc = "Project File Browser (Fern)" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Project Git Files" })

vim.keymap.set("n", "<leader>pws", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end, { desc = "Project Grep Word Under Cursor" })

vim.keymap.set("n", "<leader>pWs", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end, { desc = "Project Grep WORD Under Cursor" })

vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Project Live Grep" })
vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Project Recent Files" })

-- Plenary test
vim.api.nvim_set_keymap("n", "<leader>pt", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

-- ============================================================================
-- FIND OPERATIONS (<leader>f*) - Enhanced Discovery
-- ============================================================================

-- Primary find operations
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })

vim.keymap.set("n", "<leader>fw", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end, { desc = "Find Word Under Cursor" })

vim.keymap.set("n", "<leader>fW", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end, { desc = "Find WORD Under Cursor" })

-- System find operations
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
vim.keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "Find Options" })

-- Extension find operations
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Find Undo Tree" })
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Find Aerial Symbols" })

-- ============================================================================
-- SEARCH OPERATIONS (<leader>s*) - Content Search
-- ============================================================================

-- Primary search operations
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live Grep Search" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search Grep" })

vim.keymap.set("n", "<leader>sw", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end, { desc = "Search Word Under Cursor" })

vim.keymap.set("n", "<leader>sW", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end, { desc = "Search WORD Under Cursor" })

vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "Search Buffer Lines" })
vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "Search Commands" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })

-- ============================================================================
-- GIT OPERATIONS (<leader>g*) - Git Workflow
-- ============================================================================

-- Telescope git extensions
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git Files" })
vim.keymap.set("n", "<leader>gh", builtin.git_commits, { desc = "Git History" })

-- ============================================================================
-- BUFFER OPERATIONS (<leader>b*) - Buffer Management
-- ============================================================================

vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Switch Buffers" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#<CR>", { desc = "Delete All Buffers" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete Other Buffers" })
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close Buffer" })