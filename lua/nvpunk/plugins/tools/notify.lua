-- pretty notifications
return {
    'rcarriga/nvim-notify',
    config = function()
        vim.notify = require'notify'

        local km = require'nvpunk.internals.keymapper'
        km.wk.register({ ['<leader>n'] = { name = ' Notifications' } }, { mode = 'n' })
        km.nkeymap(
            '<leader>nd',
            function() require'notify'.dismiss() end,
            'Dismiss Notifications'
        )
        km.nkeymap(
            '<leader>nl',
            function() require'telescope'.extensions.notify.notify() end,
            'List Notifications'
        )
    end,
}
