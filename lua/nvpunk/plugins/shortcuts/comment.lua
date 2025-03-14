-- comment shortcuts
return {
    'numToStr/Comment.nvim',
    lazy = true,
    init = function()
        require('which-key').add {
            { 'gc', mode = { 'n' }, group = 'Comment line' },
            { 'gb', mode = { 'n' }, group = 'Comment block' },
        }
    end,
    config = function()
        require('Comment').setup {
            padding = true,
            sticky = true,
            toggler = {
                -- normal
                line = 'gcc',
                block = 'gbc',
            },
            opleader = {
                -- visual, pending (like dd 2 lines is 2dd, 2... is pending)
                line = 'gc',
                block = 'gb',
            },
            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gcA',
            },
            mappings = {
                basic = true,
                extra = true,
                extended = false,
            },
        }
    end,
    keys = {
        { 'gc', mode = { 'v' }, desc = 'Comment toggle linewise' },
        { 'gb', mode = { 'v' }, desc = 'Comment toggle blockwise' },
    },
}
