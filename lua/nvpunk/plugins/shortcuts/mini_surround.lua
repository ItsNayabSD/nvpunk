local icons = require 'nvpunk.internals.icons'
local sel_modes = { 'v', 's', 'x' }
-- for surrounding text with delimiters such as brackets and quotes
return {
    'echasnovski/mini.surround',
    lazy = true,
    init = function()
        require('which-key').add {
            {
                '<leader>S',
                mode = { 'n' },
                group = 'Surround',
                icon = icons.curlybraces,
            },
        }
    end,
    config = function()
        require('mini.surround').setup {
            custom_surroundings = nil,
            highlight_duration = 500,
            mappings = {
                add = 'S',
                delete = '<space>Sd',
                find = '<space>Sf',
                find_left = '<space>SF',
                highlight = '<space>Sh',
                replace = '<space>Sc',
                update_n_lines = '<space>Sn',
            },
            n_lines = 20,
            search_method = 'cover',
        }
    end,
    keys = {
        {
            'S',
            mode = sel_modes,
            desc = icons.curlybraces .. ' Surround',
        },
        { '<leader>Sd', mode = sel_modes, desc = 'Delete' },
        { '<leader>Sf', mode = sel_modes, desc = 'Find Forward' },
        { '<leader>SF', mode = sel_modes, desc = 'Find Back' },
        { '<leader>Sh', mode = sel_modes, desc = 'Highlight' },
        { '<leader>Sc', mode = sel_modes, desc = 'Replace' },
        { '<leader>Sn', mode = sel_modes, desc = 'Update 20 lines' },
    },
}
