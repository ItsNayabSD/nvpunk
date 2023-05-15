-- icons
return {
    'kyazdani42/nvim-web-devicons',
    dependencies = {
        'ryanoasis/vim-devicons',
    },
    lazy = true,
    init = function() vim.g.WebDevIconsUnicodeGlyphDoubleWidth = 1 end,
    config = function()
        local icons = require 'nvpunk.internals.icons'

        require('nvim-web-devicons').setup {
            override = {
                ['meson.build'] = {
                    icon = icons.cog,
                    color = '#6d8086',
                    name = 'Meson',
                },
                ['meson_options.txt'] = {
                    icon = icons.cog,
                    color = '#6d8086',
                    name = 'MesonOptions',
                },
                ['vert'] = { -- glsl vertex shader
                    icon = icons.vertex,
                    color = '#2ec27e',
                    name = 'Vertex',
                },
                ['frag'] = { -- glsl fragment shader
                    icon = icons.image,
                    color = '#2ec27e',
                    name = 'Fragment',
                },
                ['geom'] = { -- glsl geometry shader
                    icon = icons.cube,
                    color = '#2ec27e',
                    name = 'Geometry',
                },
                ['spv'] = {
                    icon = icons.file_binary,
                    color = '#41535b',
                    name = 'SpirV',
                },
                ['o'] = {
                    icon = icons.file_binary,
                    color = '#41535b',
                    name = 'COutput',
                },
                ['ui'] = {
                    icon = icons.desktop_dashboard,
                    color = '#1c71d8',
                    name = 'GtkUI',
                },
                ['blp'] = {
                    icon = icons.set_square,
                    color = '#1c71d8',
                    name = 'Blueprint',
                },
                ['astro'] = {
                    icon = icons.rocket,
                    color = '#1c71d8',
                    name = 'Astro',
                },
            },
            default = true,
        }
    end,
}
