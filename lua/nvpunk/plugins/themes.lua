return require'nvpunk.internals.functools'.map({
    {'navarasu/onedark.nvim'},
    {'catppuccin/nvim', name = 'catppuccin'},
    {'Mofiqul/dracula.nvim'},
    {'folke/tokyonight.nvim'},
    {'shaunsingh/nord.nvim'},
    {'luisiacc/gruvbox-baby'},
    {'tanvirtin/monokai.nvim'},
    {'shaunsingh/moonlight.nvim'},
    {'NTBBloodbath/doom-one.nvim'},
    {'sam4llis/nvim-tundra'},
    {'EdenEast/nightfox.nvim'},
    {'rose-pine/neovim', name = 'rose-pine'},
    {'rebelot/kanagawa.nvim'},
    {'kvrohit/mellow.nvim'},
    {'w3barsi/barstrata.nvim'},
    {'neanias/everforest-nvim', branch = 'main'},
}, function(theme)
    theme.lazy = true
    return theme
end)
