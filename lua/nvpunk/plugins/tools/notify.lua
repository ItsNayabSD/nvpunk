local icons = require 'nvpunk.internals.icons'
-- pretty notifications
return {
    'rcarriga/nvim-notify',
    enabled = false,
    init = function()
        require('which-key').add {
            {
                {
                    '<leader>n',
                    group = 'Notifications',
                    icon = icons.notifications,
                },
            },
        }
    end,
    config = function() vim.notify = require 'notify' end,
    lazy = false,
    priority = 80,
    keys = {
        {
            '<leader>nd',
            function()
                require('notify').dismiss {
                    pending = true,
                    silent = true,
                }
            end,
            desc = 'Dismiss Notifications',
        },
        {
            '<leader>nl',
            function() require('telescope').extensions.notify.notify() end,
            desc = 'List Notifications',
        },
    },
}
