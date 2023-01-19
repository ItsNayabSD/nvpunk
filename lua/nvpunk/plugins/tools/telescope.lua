-- Telescope: modular, powerful, extensible fuzzy finder
return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    init = function()
        local km = require'nvpunk.internals.keymapper'

        km.wk.register({ ['<leader>t'] = { name = ' Telescope' } }, { mode = 'n' })
        km.nkeymap('<leader>tf', function()
            require'nvpunk.internals.telescope_pickers'.find_files()
        end, 'Open file')
        km.nkeymap('<leader>tg', function()
            require'nvpunk.internals.telescope_pickers'.live_grep()
        end, 'Live grep')
        km.nkeymap('<leader>tr', function()
            require'telescope.builtin'.lsp_references()
        end, 'Browse references')
        km.nkeymap('<leader>th', function()
            require'telescope.builtin'.oldfiles()
        end, 'Recent files')
        km.nkeymap('<leader>tH', '<cmd>h nvpunk-shortcuts-telescope<cr>', 'Show Shortcuts')
    end,
    config = function()
        local telescope = require'telescope'
        -- local actions = require'telescope.actions'

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
    end,
    cmd = {
        'Telescope',
    },
}
