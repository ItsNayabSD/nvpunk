return {
    -- navic widget loaded in statusbar as part of lualine
    'SmiteshP/nvim-navic',
    enabled = function()
        return require('nvpunk.preferences').get_navic_enabled()
    end,
    lazy = true,
}
