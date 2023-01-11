return {
    -- better buffer line
    {'hoob3rt/lualine.nvim'},

    -- icons
    {'ryanoasis/vim-devicons'},

    -- file explorer
    {'nvim-neo-tree/neo-tree.nvim', branch = 'main', requires = {
        'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim',
        's1n7ax/nvim-window-picker'
    }},

    -- git gutter
    {'lewis6991/gitsigns.nvim'},

    -- treesitter based syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
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

    -- completion icons
    {'onsails/lspkind-nvim'},

    -- diagnostic colors for all themes
    {'folke/lsp-colors.nvim'},

    -- show which key does what in long key combos
    {'folke/which-key.nvim'},

    -- greeter
    {'goolord/alpha-nvim', branch = 'main'},

    -- pretty notifications
    {'rcarriga/nvim-notify'},

    -- replace vim.ui.input with pretty text entry
    {'stevearc/dressing.nvim'},

    -- disable relative numbers where they don't make sense
    {'sitiom/nvim-numbertoggle'},

    -- pretty and better folding
    {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},

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
