-- nice diffview
return {
    'sindrets/diffview.nvim',
    lazy = true,
    config = function()
        require'diffview'.setup {
            keymaps = {
                disable_defaults = true,
            },
        }
    end,
    keys = {
        { '<leader>?', desc = ' Diff View' },
        { '<leader>?o', '<cmd>DiffviewOpen<cr>', desc = 'DiffviewOpen' },
        { '<leader>?c', '<cmd>DiffviewClose<cr>', desc = 'DiffviewClose' },
        { '<leader>?r', '<cmd>DiffviewRefresh<cr>', desc = 'DiffviewRefresh' },
        { '<leader>?f', '<cmd>DiffviewToggleFiles<cr>', desc = 'DiffviewToggleFiles' },

        { '<leader>?0', '<cmd>DiffviewOpen HEAD<cr>', desc = 'DiffviewOpen HEAD' },
        { '<leader>?1', '<cmd>DiffviewOpen HEAD^<cr>', desc = 'DiffviewOpen HEAD^' },
        { '<leader>?2', '<cmd>DiffviewOpen HEAD^^<cr>', desc = 'DiffviewOpen HEAD^^' },
        { '<leader>?3', '<cmd>DiffviewOpen HEAD^^^<cr>', desc = 'DiffviewOpen HEAD^^^' },
        { '<leader>?4', '<cmd>DiffviewOpen HEAD^^^^<cr>', desc = 'DiffviewOpen HEAD^^^^' },

        { '<leader>?H', '<cmd>h nvpunk-shortcuts-diffview<cr>', desc = 'Show Shortcuts' },
    },
    cmd = {
        'DiffviewLog',
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewRefresh',
        'DiffviewFocusFiles',
        'DiffviewFileHistory',
        'DiffviewToggleFiles',
    },
}
