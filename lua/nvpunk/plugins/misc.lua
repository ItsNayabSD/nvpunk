return {
    -- utility functions; common dependency
    { 'nvim-lua/plenary.nvim', lazy = true },

    -- automatic mkdir on new file save if dir does not exist
    { 'jghauser/mkdir.nvim' },
    {
        'echasnovski/mini.trailspace',
        event = 'BufEnter',
        version = false,
        config = function()
            require('mini.trailspace').setup()
        end,
        keys = {
            {
                '<space>Wt',
                function()
                    require('mini.trailspace').trim()
                end,
                desc = 'Trim all whitespace'
            },
        }
    }
}
