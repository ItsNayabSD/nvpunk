return {
    'SmiteshP/nvim-navic',
    enabled = function()
        return require('nvpunk.preferences').get_navic_enabled()
    end,
    config = function()
        require('nvim-navic').setup {
            icons = {
                File = ' ',
                Module = ' ',
                Namespace = ' ',
                Package = ' ',
                Class = ' ',
                Method = ' ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = '練',
                Interface = '練',
                Function = ' ',
                Variable = ' ',
                Constant = ' ',
                String = ' ',
                Number = ' ',
                Boolean = '◩ ',
                Array = ' ',
                Object = ' ',
                Key = ' ',
                Null = 'ﳠ ',
                EnumMember = ' ',
                Struct = ' ',
                Event = ' ',
                Operator = ' ',
                TypeParameter = ' ',
            },
            highlight = true,
            separator = ' ',
            depth_limit = 0,
            depth_limit_indicator = '…',
            safe_output = true,
        }
    end,
}
