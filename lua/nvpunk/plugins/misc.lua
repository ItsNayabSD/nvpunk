return {
    -- utility functions; common dependency
    { 'nvim-lua/plenary.nvim', lazy = true },

    -- automatic mkdir on new file save if dir does not exist
    { 'jghauser/mkdir.nvim' },
    {
        'echasnovski/mini.trailspace',
        event = 'BufEnter',
        version = false,
        config = function() require('mini.trailspace').setup() end,
        keys = {
            {
                '<space>Wt',
                function() require('mini.trailspace').trim() end,
                desc = 'Trim all whitespace',
            },
        },
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            picker = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
    },
}
