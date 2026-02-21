require("richard")
if vim.g.neovide then
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor or 1.0
    vim.keymap.set({ "n", "v" }, "<C-+>", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
    end)
    vim.keymap.set({ "n", "v" }, "<C-->", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
    end)
    vim.keymap.set({ "n", "v" }, "<C-0>", function()
        vim.g.neovide_scale_factor = 1.0
    end)
end
