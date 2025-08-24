return {
    "mbbill/undotree",

    config = function() 
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_ShortIndicators = 1
        vim.g.undotree_SetFocusWhenToggle = 1
        
        -- Keybinding moved to remap.lua for better organization
    end
}
