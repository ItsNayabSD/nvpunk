require('noice').setup {
    cmdline = {
        view = 'cmdline_popup',
        icons = {
            ['/'] = { icon = ' ', hl_group = 'DiagnosticWarn' },
            ['?'] = { icon = ' ', hl_group = 'DiagnosticWarn' },
            [':'] = {
                icon = ' ',
                hl_group = 'DiagnosticInfo',
                firstc = false,
            },
        },
    },
    popupmenu = {
        enabled = true,
        ---@type 'nui'|'cmp'
        backend = 'nui',
    },
    views = {
        cmdline_popup = {
            position = {
                row = 5,
                col = '50%',
            },
            size = {
                width = 60,
                height = 'auto',
            },
        },
        popupmenu = {
            relative = 'editor',
            position = {
                row = 8,
                col = '50%',
            },
            size = {
                width = 60,
                height = 10,
            },
            border = {
                style = 'rounded',
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = {
                    Normal = 'Normal',
                    FloatBorder = 'DiagnosticInfo',
                },
            },
        },
    },
}
