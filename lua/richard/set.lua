-- preview substitutions
vim.o.inccommand = 'split'
-- do not show mode
vim.o.showmode = false


-- Set cursor style
vim.opt.guicursor = ""
vim.opt.cursorline = true

-- Show line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3  -- Tree view

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable smart indentation
vim.opt.smartindent = true

-- Disable line wrapping
vim.opt.wrap = false

-- Disable swap and backup files, enable persistent undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable search highlighting, enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable true color support in the terminal
vim.opt.termguicolors = true

-- Keep 8 lines of context around the cursor
vim.opt.scrolloff = 8
-- Always show the sign column
vim.opt.signcolumn = "yes"
-- Add @ and - to the list of characters that can be part of a filename
vim.opt.isfname:append("@-@")

-- Set the update time to 50ms
vim.opt.updatetime = 50

-- Which-key timeout settings for better responsiveness
vim.opt.timeout = true
vim.opt.timeoutlen = 300  -- Time to wait for a mapped sequence to complete (in milliseconds)

-- Show a color column at 80 characters
vim.opt.colorcolumn = "80"
