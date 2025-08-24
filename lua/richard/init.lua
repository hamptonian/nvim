require("richard.remap")
require("richard.set")
require("richard.lazy_init")

local augroup = vim.api.nvim_create_augroup
local richard = augroup('richard', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- Hot-reload lua modules for development
function R(name)
    require("plenary.reload").reload_module(name)
end

-- Associate .templ files with the templ filetype
vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

-- Highlight yanked text
autocmd('TextYankPost', {
    desc = 'Highlight when yanking',
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 80,
        })
    end,
})

-- Trim trailing whitespace before saving
autocmd({"BufWritePre"}, {
    group = richard,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Format on save
autocmd({"BufWritePre"}, {
    group = richard,
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})


-- LSP configuration
autocmd('LspAttach', {
    group = richard,
    callback = _G.setup_lsp_keymaps
})
