--- Set nightcity color scheme
---@param style 'kabuki' | 'afterlife'
return function(style)
    require('nightcity').setup {
        style = style,
        terminal_colors = true,
        invert_colors = {
            -- Invert colors for the following syntax groups
            cursor = true,
            diff = true,
            error = true,
            search = true,
            selection = false,
            signs = false,
            statusline = true,
            tabline = false,
        },
        font_style = {
            -- Style to be applied to different syntax groups
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true },
            variables = {},
            search = { bold = true },
        },
        -- Plugin integrations. Use `default = false` to disable all integrations.
        plugins = { default = true },
    }
    vim.cmd('colorscheme nightcity')
    reload 'nvpunk.theme_manager.lualine' 'auto'
end
