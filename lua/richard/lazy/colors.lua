function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)
end

return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require('rose-pine').setup({
            variant = "auto", -- auto, main, moon, or dawn
            dark_variant = "moon", -- Set moon as the dark variant
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = false, -- Keep italics disabled as per your original config
                transparency = true, -- Enable transparency as per your original Normal/NormalFloat settings
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            highlight_groups = {
                -- Set Comment color to iris (soft purple)
                Comment = { fg = "muted", italic = false },
                -- Set LineNr color to gold (warm yellow)
                LineNr = { fg = "subtle"  },
                -- Optionally, set CursorLineNr for the current line number
                CursorLineNr = { fg = "gold" },
                CursorLine = { bg = "muted", blend = 20 }
            },
        })

        ColorMyPencils()
    end
}
