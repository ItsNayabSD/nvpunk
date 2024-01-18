local M = {}

M.set_leader = function()
    vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '
end

M.set_keymaps = function()
    local km = require 'nvpunk.internals.keymapper'

    -- Tweaks to defaults

    -- hold on to selection when changing indentation
    km.vkeymap('<', '<gv')
    km.vkeymap('>', '>gv')

    -- move selection
    km.vkeymap('<A-k>', ":m '<-2<CR>gv=gv")
    km.vkeymap('<A-j>', ":m '>+1<CR>gv=gv")

    -- pasting in visual mode doesn't overwrite the clipboard content
    km.vkeymap('p', '"_dP')

    -- pressing esc twice goes to normal mode in terminal windows
    km.tkeymap('<Esc><Esc>', '<C-\\><C-n>')

    -- wrapped text movement
    km.nkeymap('<A-j>', 'gj')
    km.nkeymap('<A-k>', 'gk')
    km.nkeymap('<A-Down>', 'gj')
    km.nkeymap('<A-Up>', 'gk')

    -- Terminal splitter
    km.nkeymap('<leader>/s', '<cmd>vs<cr><cmd>terminal<cr>',
        require('nvpunk.internals.icons').hsplit .. ' Horizontal')
    km.nkeymap(
        '<leader>/i',
        '<cmd>sp<cr><cmd>terminal<cr>',
        require('nvpunk.internals.icons').vsplit .. ' Vertical'
    )
    pcall(function()
        require('which-key').register {
            ['<leader>/'] = { name = ' Term Split' },
            ['<leader>W'] = { name = 'Whitespace' },
        }
    end)
end

return M
