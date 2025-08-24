return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup({
            -- Options for grug-far
            headerMaxWidth = 80,
            resultsSeparatorLineChar = '─',
            folding = {
                enabled = true,
                folds = {
                    'resultLocation',
                }
            },
            -- Keybindings will be set in remap.lua
        })
    end
}

