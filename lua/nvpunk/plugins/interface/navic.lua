return {
    'SmiteshP/nvim-navic',
    enabled = function()
        return require('nvpunk.preferences').get_navic_enabled()
    end,
    config = function()
        local icons = require 'nvpunk.internals.icons'
        require('nvim-navic').setup {
            icons = {
                File = icons.file .. ' ',
                Module = icons.puzzle .. ' ',
                Namespace = icons.curlybraces .. ' ',
                Package = icons.package .. ' ',
                Class = icons.struct .. ' ',
                Method = icons.method .. ' ',
                Property = icons.property .. ' ',
                Field = icons.field .. ' ',
                Constructor = icons.crane .. ' ',
                Enum = icons.enum .. ' ',
                Interface = icons.interface .. ' ',
                Function = icons.function_ .. ' ',
                Variable = icons.variable .. ' ',
                Constant = icons.constant .. ' ',
                String = icons.string .. ' ',
                Number = icons.number .. ' ',
                Boolean = icons.boolean .. ' ',
                Array = icons.array .. ' ',
                Object = icons.curlybraces .. ' ',
                Key = icons.key .. ' ',
                Null = icons.null .. ' ',
                EnumMember = icons.enum_member .. ' ',
                Struct = icons.struct .. ' ',
                Event = icons.event .. ' ',
                Operator = icons.operator .. ' ',
                TypeParameter = icons.big_t .. ' ',
            },
            highlight = true,
            separator = ' ',
            depth_limit = 0,
            depth_limit_indicator = '…',
            safe_output = true,
        }
    end,
}
