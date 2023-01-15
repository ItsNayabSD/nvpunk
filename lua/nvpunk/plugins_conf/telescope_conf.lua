local telescope = require'telescope'

local actions = require'telescope.actions'

telescope.setup {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        path_display = { 'smart' },
    },
    extensions = {
        ['ui-select'] = {
            require'telescope.themes'.get_dropdown({})
        }
    }
}

telescope.load_extension('ui-select')

local km = require'nvpunk.internals.keymapper'

km.wk.register({ ['<leader>t'] = { name = ' Telescope' } }, { mode = 'n' })
km.nkeymap('<leader>tf', function()
    require'telescope.builtin'.find_files(
        require'telescope.themes'.get_dropdown { previewer = false }
    )
end, 'Open file')
km.nkeymap('<leader>tg', '<cmd>Telescope live_grep<cr>', 'Live grep')
km.nkeymap('<leader>tr', '<cmd>Telescope lsp_references<cr>', 'Browse references')
km.nkeymap('<leader>th', function()
    require'telescope.builtin'.oldfiles(
        require'telescope.themes'.get_dropdown { previewer = false }
    )
end, 'Recent files')
km.nkeymap('<leader>tH', '<cmd>h nvpunk-shortcuts-telescope<cr>', 'Show Shortcuts')
