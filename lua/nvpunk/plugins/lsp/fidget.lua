-- show language server starting progress in the lower right corner
return {
    'j-hui/fidget.nvim',
    branch = 'legacy',
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
}
