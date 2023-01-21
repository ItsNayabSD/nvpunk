return {
    -- install language servers with mason

    -- nvim built-in lsp additional stuff
    -- easier lsp configuration
    { 'neovim/nvim-lspconfig' },

    -- lua based snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
    },

    -- completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',
            'lukas-reineke/cmp-under-comparator',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
            'chrisgrieser/cmp-nerdfont',
        },
    },

    -- code outline (classes, functions, vars...)
    {
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
            { 'go', '<cmd>AerialToggle<cr>', mode = 'n', desc = 'פּ Outline' },
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
    },

    -- step by step signature help
    { 'ray-x/lsp_signature.nvim' },

    -- diagnostics tray
    {
        'folke/trouble.nvim',
        lazy = true,
        config = function()
            require('trouble').setup {
                position = 'bottom',
                icons = true,
                action_keys = {
                    close = 'q', -- close the list
                    cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = 'r', -- manually refresh
                    jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
                    open_split = 'i', -- open buffer in new split
                    open_vsplit = 's', -- open buffer in new vsplit
                    open_tab = 't', -- { '<c-t>' }, -- open buffer in new tab
                    jump_close = 'o', -- jump to the diagnostic and close the list
                    toggle_mode = 'm', -- toggle between 'workspace' and 'document' diagnostics mode
                    toggle_preview = 'P', -- toggle auto_preview
                    hover = { 'K', '<leader>e' }, -- opens a small popup with the full multiline message
                    preview = 'p', -- preview the diagnostic location
                    close_folds = { 'zM', 'zm' }, -- close all folds
                    open_folds = { 'zR', 'zr' }, -- open all folds
                    toggle_fold = { 'zA', 'za' }, -- toggle fold of current file
                    previous = 'k', -- preview item
                    next = 'j', -- next item
                },
                use_diagnostic_signs = true,
            }
        end,
        keys = {
            {
                '<leader>T',
                '<cmd>TroubleToggle<cr>',
                mode = 'n',
                desc = 'Trouble',
            },
        },
        cmd = {
            'Trouble',
            'TroubleClose',
            'TroubleToggle',
            'TroubleRefresh',
        },
    },

    -- Use Neovim as a language server to inject LSP diagnostics,
    -- code actions, and more via Lua.
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- java language server from eclipse
    { 'mfussenegger/nvim-jdtls' },

    -- show language server starting progress in the lower right corner
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {
                text = {
                    spinner = 'dots',
                },
                align = {
                    bottom = true,
                    right = true,
                },
            }
        end,
    },

    -- completion icons
    { 'onsails/lspkind-nvim' },

    -- diagnostic colors for all themes
    { 'folke/lsp-colors.nvim' },
}
