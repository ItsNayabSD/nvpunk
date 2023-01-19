return {
    -- better buffer line
    {'hoob3rt/lualine.nvim'},

    -- icons
    {'ryanoasis/vim-devicons'},

    -- file explorer
    {'nvim-neo-tree/neo-tree.nvim', branch = 'main', dependencies = {
        'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim',
        's1n7ax/nvim-window-picker'
    }},

    -- git gutter
    {'lewis6991/gitsigns.nvim'},

    -- treesitter based syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    },

    -- better tabline
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    },

    -- color preview
    {'brenoprata10/nvim-highlight-colors'},

    -- show which key does what in long key combos
    {'folke/which-key.nvim'},

    -- greeter
    {'goolord/alpha-nvim', branch = 'main'},

    -- pretty and better folding
    {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},

    -- indentation marks
    {'lukas-reineke/indent-blankline.nvim'},

    -- replacement for messages, cmdline, popupmenu
    -- {
    --     'folke/noice.nvim',
    --     requires = {
    --         'MunifTanjim/nui.nvim',
    --     }
    -- }

    -- breadcrumbs
    {'SmiteshP/nvim-navic'},

    -- better quick fix pane
    {'kevinhwang91/nvim-bqf'}
}
