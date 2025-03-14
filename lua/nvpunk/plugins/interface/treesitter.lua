-- treesitter based syntax highlighting
return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').compilers = { 'clang', 'gcc' }
        require('nvim-treesitter.install').update { with_sync = true }
    end,
    config = function()
        -- TODO: optimize this so that it doesn't alwyas run on startup
        if vim.fn.executable 'gcc' ~= 1 or vim.fn.executable 'g++' ~= 1 then
            vim.notify(
                'Treesitter is disabled\n'
                    .. 'Please install gcc and g++ to enable Treesitter',
                vim.log.levels.ERROR,
                { title = 'nvpunk.plugins.treesitter' }
            )
            return
        end
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'ini',
                'lua',
                'toml',
                'vim',
                'yaml',
            },
            auto_install = true,
            sync_install = false, -- don't peg slow systems?
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = false,
                keymaps = {
                    init_selection = '<leader>ss',
                    node_incremental = '<Up>',
                    scope_incremental = '<S-Up>',
                    node_decremental = '<C-Up>',
                },
            },
            indent = {
                enable = false, -- tree-sitter indent keeps being broken
            },
        }
    end,
}
