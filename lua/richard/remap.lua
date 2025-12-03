-- Set the map leader to space vim.g.mapleader = " "
--
vim.g.mapleader = " "

-- Note: <leader>pv moved to comprehensive keybinding system below

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m >>+1<CR>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "K", ":m <<-2<CR>gv=gv", { desc = "Move Line Up" })

-- Moved Plenary test to project operations
vim.api.nvim_set_keymap("n", "<leader>pt", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

-- Join lines without moving the cursor
vim.keymap.set("n", "S-j", "mzJ`z", { desc = "Join Lines" })
-- Scroll down and center the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down & Center" })
-- Scroll up and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up & Center" })
-- Go to the next search result and center the cursor
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result" })
-- Go to the previous search result and center the cursor
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Search Result" })
-- Auto-indent a paragraph
vim.keymap.set("n", "=ap", "ma=ap'a")
-- Restart the LSP
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Paste without yanking the replaced text
vim.keymap.set("x", "<leader>p", [[ "_dP]], { desc = "Paste Without Yanking" })

-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [[ "+y]], { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>Y", [[ "+Y]], { desc = "Yank Line to System Clipboard" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete Without Yanking" })

-- Use Ctrl-C as Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")
-- Open tmux sessionizer in a new window
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux Sessionizer" })
-- Open tmux sessionizer in a vertical split
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
-- Open tmux sessionizer in a new window with session 0
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
-- Format the current buffer
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ bufnr = 0 })
end, { desc = "Format Buffer" })

-- Quickfix navigation (overrides window navigation for these specific commands)
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix Item" })
-- Go to the next item in the location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location List Item" })
-- Go to the previous item in the location list
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location List Item" })

-- Replace all occurrences of the word under the cursor
vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace Word Under Cursor" }
)
-- Make the current file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File Executable" })

-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Source Current File" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================================================
-- TERMINAL OPERATIONS (<leader>t*) - Terminal Management
-- ============================================================================

vim.keymap.set("n", "<leader>t", "<cmd>split | terminal<CR>", { desc = "Open Terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Terminal Horizontal Split" })
vim.keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Terminal Vertical Split" })
vim.keymap.set("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Terminal in Current Window" })

-- ============================================================================
-- QUIT OPERATIONS (<leader>q*) - Neovim Exit
-- ============================================================================

vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Quit Without Saving" })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<CR>", { desc = "Write and Quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit All Windows" })
vim.keymap.set("n", "<leader>qx", "<cmd>x<CR>", { desc = "Write if Changed and Quit" })

-- Diagnostics (moved from <leader>q)
vim.keymap.set("n", "<leader>x", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- LSP keymaps (set when LSP attaches to buffer)
local function setup_lsp_keymaps(e)
	local opts = { buffer = e.buf }
	-- Go to definition
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
	-- Show hover information
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
	-- Search for symbols across the entire project
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, vim.tbl_extend("force", opts, { desc = "Workspace Symbol Search" }))
	-- Open diagnostics
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, vim.tbl_extend("force", opts, { desc = "Open Diagnostics" }))
	-- Show contextual code actions, like refactoring and quick fixes
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, vim.tbl_extend("force", opts, { desc = "Code Actions" }))
	-- References
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, vim.tbl_extend("force", opts, { desc = "References" }))
	-- Rename
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
	-- Show function signature information (in insert mode)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, vim.tbl_extend("force", opts, { desc = "Signature Help" }))
	-- Go to next diagnostic
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
	-- Go to previous diagnostic
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))
end

-- Export the LSP keymap setup function for use in init.lua
_G.setup_lsp_keymaps = setup_lsp_keymaps

-- ============================================================================
-- COMPREHENSIVE KEYBINDING SYSTEM
-- ============================================================================

-- Save file functionality
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save File" })

-- Close buffer functionality
vim.keymap.set("n", "<C-q>", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
vim.keymap.set("i", "<C-q>", "<Esc><cmd>bdelete<CR>", { desc = "Close Buffer" })

-- ============================================================================
-- HARPOON 2 - ThePrimeagen Style (Loaded conditionally)
-- ============================================================================

-- Harpoon keybindings - will be set up when harpoon loads
vim.keymap.set("n", "<leader>a", function()
	local harpoon = require("harpoon")
	harpoon:list():add()
end, { desc = "Harpoon Add" })

vim.keymap.set("n", "<C-e>", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Menu" })

-- Use leader + numbers for harpoon navigation (cleaner, no conflicts)
vim.keymap.set("n", "<leader>1", function()
	local harpoon = require("harpoon")
	harpoon:list():select(1)
end, { desc = "Harpoon File 1" })

vim.keymap.set("n", "<leader>2", function()
	local harpoon = require("harpoon")
	harpoon:list():select(2)
end, { desc = "Harpoon File 2" })

vim.keymap.set("n", "<leader>3", function()
	local harpoon = require("harpoon")
	harpoon:list():select(3)
end, { desc = "Harpoon File 3" })

vim.keymap.set("n", "<leader>4", function()
	local harpoon = require("harpoon")
	harpoon:list():select(4)
end, { desc = "Harpoon File 4" })

-- ============================================================================
-- PROJECT OPERATIONS (<leader>p*) - ThePrimeagen Style
-- ============================================================================

-- Keep existing ThePrimeagen keybindings for backward compatibility
vim.keymap.set("n", "<leader>pv", ":Fern . -drawer -toggle<CR>", { desc = "Project View (File Explorer)" })
vim.keymap.set("n", "<leader>pf", function()
	require("telescope.builtin").find_files()
end, { desc = "Project Find Files" })
vim.keymap.set("n", "<C-p>", function()
	require("telescope.builtin").git_files()
end, { desc = "Project Git Files" })
vim.keymap.set("n", "<leader>pws", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Project Grep Word Under Cursor" })
vim.keymap.set("n", "<leader>pWs", function()
	local word = vim.fn.expand("<cWORD>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Project Grep WORD Under Cursor" })
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").live_grep()
end, { desc = "Project Live Grep" })
vim.keymap.set("n", "<leader>pr", function()
	require("telescope.builtin").oldfiles()
end, { desc = "Project Recent Files" })

-- ============================================================================
-- FIND OPERATIONS (<leader>f*) - Enhanced Discovery
-- ============================================================================

-- Primary find operations
vim.keymap.set("n", "<leader>f", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").git_files()
end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fr", function()
	require("telescope.builtin").oldfiles()
end, { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>fR", function()
	require("telescope.builtin").resume()
end, { desc = "Resume Last Search" })
vim.keymap.set("n", "<leader>fw", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Find Word Under Cursor" })
vim.keymap.set("n", "<leader>fW", function()
	local word = vim.fn.expand("<cWORD>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Find WORD Under Cursor" })

-- System find operations
vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Find Help" })
vim.keymap.set("n", "<leader>fk", function()
	require("telescope.builtin").keymaps()
end, { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").commands()
end, { desc = "Find Commands" })
vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").vim_options()
end, { desc = "Find Options" })

-- Extension find operations
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Find Undo Tree" })
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Find Aerial Symbols" })

-- ============================================================================
-- SEARCH OPERATIONS (<leader>s*) - Content Search
-- ============================================================================

-- Primary search operations
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live Grep Search" })
vim.keymap.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Search Grep" })
vim.keymap.set("n", "<leader>sw", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Search Word Under Cursor" })
vim.keymap.set("n", "<leader>sW", function()
	local word = vim.fn.expand("<cWORD>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Search WORD Under Cursor" })
vim.keymap.set("n", "<leader>sb", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Search Buffer Lines" })

-- Advanced search operations
vim.keymap.set("n", "<leader>sr", function()
	require("grug-far").open()
end, { desc = "Search & Replace (GrugFar)" })
vim.keymap.set("n", "<leader>sc", function()
	require("telescope.builtin").commands()
end, { desc = "Search Commands" })
vim.keymap.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", function()
	require("telescope.builtin").keymaps()
end, { desc = "Search Keymaps" })

-- ============================================================================
-- UTILITY OPERATIONS (<leader>u*) - Toggles & Tools
-- ============================================================================

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
vim.keymap.set("n", "<leader>uz", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>ua", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial" })

-- Editor toggles
vim.keymap.set("n", "<leader>us", function()
	vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle Spell Check" })
vim.keymap.set("n", "<leader>uw", function()
	vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle Word Wrap" })

-- LSP toggles
vim.keymap.set("n", "<leader>ud", function()
	if _G.diagnostics_enabled == nil then
		_G.diagnostics_enabled = true
	end

	if _G.diagnostics_enabled then
		vim.diagnostic.disable()
		_G.diagnostics_enabled = false
		print("Diagnostics disabled")
	else
		vim.diagnostic.enable()
		_G.diagnostics_enabled = true
		print("Diagnostics enabled")
	end
end, { desc = "Toggle LSP Diagnostics" })

vim.keymap.set("n", "<leader>ui", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
	print("Inlay hints " .. (enabled and "disabled" or "enabled"))
end, { desc = "Toggle LSP Inlay Hints" })

-- ============================================================================
-- GIT OPERATIONS (<leader>g*) - Git Workflow
-- ============================================================================

-- Fugitive core operations
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })

-- Telescope git extensions
vim.keymap.set("n", "<leader>gb", function()
	require("telescope.builtin").git_branches()
end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gc", function()
	require("telescope.builtin").git_commits()
end, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gf", function()
	require("telescope.builtin").git_files()
end, { desc = "Git Files" })
vim.keymap.set("n", "<leader>gh", function()
	require("telescope.builtin").git_commits()
end, { desc = "Git History" })

-- Merge conflict resolution
vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "Diff Get Left (merge)" })
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "Diff Get Right (merge)" })

-- ============================================================================
-- BUFFER OPERATIONS (<leader>b*) - Buffer Management
-- ============================================================================

vim.keymap.set("n", "<leader>bb", function()
	require("telescope.builtin").buffers()
end, { desc = "Switch Buffers" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#<CR>", { desc = "Delete All Buffers" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete Other Buffers" })
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close Buffer" })

-- ============================================================================
-- WINDOW OPERATIONS (<leader>w*) - Window Management
-- ============================================================================

vim.keymap.set("n", "<leader>w-", "<cmd>split<CR>", { desc = "Split Horizontal" })
vim.keymap.set("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Delete Window" })
vim.keymap.set("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close Other Windows" })
vim.keymap.set("n", "<leader>wm", "<cmd>only<CR>", { desc = "Maximize Window" })

-- ============================================================================
-- MARKS OPERATIONS (<leader>m*) - Marks Navigation
-- ============================================================================

vim.keymap.set("n", "<leader>m", function()
	require("telescope.builtin").marks()
end, { desc = "Show All Marks" })
vim.keymap.set("n", "<leader>M", "<cmd>delmarks a-zA-Z0-9<CR>", { desc = "Delete All Marks in Buffer" })
vim.keymap.set("n", "<leader>'", function()
	require("telescope.builtin").marks()
end, { desc = "Jump to Mark (Telescope)" })
