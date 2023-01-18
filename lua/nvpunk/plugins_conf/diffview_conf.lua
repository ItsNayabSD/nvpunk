-- no conf, just keymaps

local km = require'nvpunk.internals.keymapper'

km.wk.register({ ['<leader>?'] = { name = ' Diff View' } })

km.nkeymap('<leader>?o', '<cmd>DiffviewOpen<cr>', 'DiffviewOpen')
km.nkeymap('<leader>?c', '<cmd>DiffviewClose<cr>', 'DiffviewClose')
km.nkeymap('<leader>?r', '<cmd>DiffviewRefresh<cr>', 'DiffviewRefresh')
km.nkeymap('<leader>?f', '<cmd>DiffviewToggleFiles<cr>', 'DiffviewToggleFiles')

km.nkeymap('<leader>?0', '<cmd>DiffviewOpen HEAD<cr>', 'DiffviewOpen HEAD')
km.nkeymap('<leader>?1', '<cmd>DiffviewOpen HEAD^<cr>', 'DiffviewOpen HEAD^')
km.nkeymap('<leader>?2', '<cmd>DiffviewOpen HEAD^^<cr>', 'DiffviewOpen HEAD^^')
km.nkeymap('<leader>?3', '<cmd>DiffviewOpen HEAD^^^<cr>', 'DiffviewOpen HEAD^^^')
km.nkeymap('<leader>?4', '<cmd>DiffviewOpen HEAD^^^^<cr>', 'DiffviewOpen HEAD^^^^')

km.nkeymap(
    '<leader>?H',
    '<cmd>h nvpunk-shortcuts-diffview<cr>',
    'Show Shortcuts'
)
