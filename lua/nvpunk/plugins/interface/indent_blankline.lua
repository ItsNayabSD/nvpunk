-- indentation marks
return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        local nonfile = require 'nvpunk.internals.nonfile'
        vim.g.indent_blankline_filetype_exclude = nonfile.filetypes
        vim.g.indent_blankline_buftype_exclude = nonfile.buftypes

        vim.g.indent_blankline_enabled =
            require('nvpunk.preferences').get_indent_blankline_enabled()

        require('indent_blankline').setup {
            show_current_context = true,
            show_current_context_start = true,
        }
    end,
}
