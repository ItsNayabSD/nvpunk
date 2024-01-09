-- show language server starting progress in the lower right corner
return {
    'j-hui/fidget.nvim',
    branch = 'main',
    config = function()
        local icons = require 'nvpunk.internals.icons'
        require('fidget').setup {
            progress = {
                display = {
                    render_limit = 8,
                    done_icon = icons.tick,
                }
            }
        }
    end,
}
