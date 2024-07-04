-- git gutter
local icons = require 'nvpunk.internals.icons'
return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add = {
                    text = icons.gutter_left,
                },
                change = {
                    text = icons.gutter_left,
                },
                delete = {
                    text = icons.gutter_low,
                },
                topdelete = {
                    text = icons.gutter_high,
                },
                changedelete = {
                    text = icons.gutter_left,
                },
                untracked = {
                    text = icons.gutter_left,
                },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = require('nvpunk.preferences').get_small_window_border(),
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1,
            },
        }
    end,
    lazy = true,
    cmd = {
        'Gitsigns',
    },
    keys = {
        { '<leader>g', desc = icons.git .. ' Git' },
        {
            '<leader>gb',
            '<cmd>Gitsigns blame_line<cr>',
            desc = icons.back_in_time .. ' Blame line',
        },
        {
            '<leader>g]',
            '<cmd>Gitsigns next_hunk<cr>',
            desc = icons.next .. ' Next hunk',
        },
        {
            '<leader>g[',
            '<cmd>Gitsigns prev_hunk<cr>',
            desc = icons.prev .. ' Prev hunk',
        },
        {
            '<leader>g?',
            '<cmd>Gitsigns preview_hunk<cr>',
            desc = icons.diff .. ' Preview changes',
        },
    },
    event = {
        'BufEnter',
    },
}
