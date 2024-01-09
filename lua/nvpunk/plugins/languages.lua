return {
    { 'petRUShka/vim-opencl' },
    { 'tikhomirov/vim-glsl' },
    -- For automatic code formatting
    { 'sbdchd/neoformat' },
    -- For hugo templating
    { 'phelipetls/vim-hugo' },
    -- support for astro
    {
        'wuelnerdotexe/vim-astro',
        lazy = true,
        config = function()
            vim.g.astro_typescrypt = 'enable'
            vim.g.astro_stylus = 'disable'
        end,
        ft = { 'astro' },
    },

    -- support for MDX
    { 'jxnblk/vim-mdx-js' },

    {
        'saecki/crates.nvim',
        lazy = true,
        event = { "BufRead Cargo.toml" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^3', -- Recommended
        ft = { 'rust' },
    }
}
