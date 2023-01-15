require'aerial'.setup {
    backends = { 'lsp', 'treesitter', 'markdown', },
    layout = {
        default_direction = 'prefer_right',
        placement = 'edge', -- 'edge' | 'window'
    },

    attach_mode = 'global', -- 'window' | 'global'

    nerd_font = 'auto',
}

require'nvpunk.internals.keymapper'.nkeymap(
    'go', '<cmd>AerialToggle<cr>', 'פּ Outline'
)
