
return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    config = function()
        require("zen-mode").setup({
            window = {
                backdrop = 0.95,
                width = 120,
                height = 1,
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
            },
        })
        
        -- Keybinding moved to remap.lua for better organization
    end
}

