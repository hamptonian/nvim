-- Basic vim keymaps - core editor functionality
vim.g.mapleader = " "

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })

-- Join lines without moving the cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines" })

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

-- Tmux integration
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux Sessionizer" })
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

-- Format the current buffer
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ bufnr = 0 })
end, { desc = "Format Buffer" })

-- Quickfix navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix Item" })

-- Location list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location List Item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location List Item" })

-- Replace all occurrences of the word under the cursor
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace Word Under Cursor" }
)

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File Executable" })

-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Source Current File" })

-- Disable arrow keys with helpful messages
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Save file functionality
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save File" })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save File" })

-- Close buffer functionality
vim.keymap.set("n", "<C-q>", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
vim.keymap.set("i", "<C-q>", "<Esc><cmd>bdelete<CR>", { desc = "Close Buffer" })

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>x", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Load other keymap modules
require("richard.remap.telescope")
require("richard.remap.lsp") 
require("richard.remap.plugins")