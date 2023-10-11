-- indentation marks
return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        local nonfile = require 'nvpunk.internals.nonfile'

        vim.g.indent_blankline_enabled =
            require('nvpunk.preferences').get_indent_blankline_enabled()

        require('ibl').setup {
            enabled = require('nvpunk.preferences').get_indent_blankline_enabled(),
            indent = {
                char = "│"
            },
            exclude = {
                filetypes = nonfile.filetypes,
                buftypes = nonfile.buftypes,
            }
        }
    end,
}
