-- code outline (classes, functions, vars...)
return {
    'stevearc/aerial.nvim',
    lazy = true,
    config = function()
        require('aerial').setup {
            backends = { 'lsp', 'treesitter', 'markdown' },
            layout = {
                default_direction = 'prefer_right',
                placement = 'edge', -- 'edge' | 'window'
            },
            attach_mode = 'global', -- 'window' | 'global'
            nerd_font = 'auto',
        }
    end,
    keys = {
        { 'go', '<cmd>AerialToggle<cr>', mode = 'n', desc = 'Outline' },
    },
    cmd = {
        'AerialToggle',
        'AerialOpen',
        'AerialOpenAll',
        'AerialClose',
        'AerialCloseAll',
        'AerialNext',
        'AerialPrev',
        'AerialGo',
        'AerialInfo',
    },
}
