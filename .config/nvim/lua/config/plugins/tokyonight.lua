local api = require('nvim-tree.api')
vim.cmd([[colorscheme tokyonight-day]])

require("tokyonight").setup({
    style = "day",
    styles = {
        comments = { italic = true },
        sidebars = "dark"
    },
    light_style = "day",
    day_brightness = 0.2,
    dim_inactive = false,
    on_highlights = function(hl, c)
        hl.WinSeparator = {
            fg = c.dark3
        }
    end
})
