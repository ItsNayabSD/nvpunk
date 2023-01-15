-- lsp/buffer specific keymaps in lsp/keymaps.lua

local km = require'nvpunk.internals.keymapper'

----------
---------- Leader
----------

--Remap space as leader key
km.keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------
---------- Personal shortcuts
----------

km.nkeymap('<leader>A', '<CMD>Alpha<CR>', ' Open Greeter')

-- Alt ^ wraps selection in <sup>whatever</sup>
-- Alt _ wraps selection in <sub>whatever</sub>
-- km.vkeymap('<A-^>', 'c<sup><Esc>pa</sup><Esc>')
-- km.vkeymap('<A-_>', 'c<sub><Esc>pa</sub><Esc>')
-- km.inkeymap('<A-^>', '<Esc>s<sup><Esc>pa</sup>')
-- km.inkeymap('<A-_>', '<Esc>s<sub><Esc>pa</sub>')

-- Alt S takes a screenshot and saves in a folder called by the filename.img
-- with the name as datetime and inserts it in the text
-- local screenshot_sequence = "<Esc>:let scrotfname=@% . '.img/' . strftime('%FT%H_%M_%S') . '.png'<CR>:execute '!mkdir -p ' . @% . '.img'<CR>:execute '!gnome-screenshot -a -f \"' . scrotfname . '\"'<CR>:execute 'normal! a' . scrotfname<CR><Esc>"

-- km.inkeymap('<A-S>', screenshot_sequence, {noremap = true, silent = true})

----------
---------- Tweaks to defaults
----------

-- hold on to selection when changing indentation
km.vkeymap('<', '<gv')
km.vkeymap('>', '>gv')

-- move selection
km.vkeymap('<A-k>', ':m \'<-2<CR>gv=gv')
km.vkeymap('<A-j>', ':m \'>+1<CR>gv=gv')  -- this doesn't seem to work

-- pasting in visual mode doesn't overwrite the clipboard content
km.vkeymap('p', '"_dP')

-- esc goes to normal mode in terminal windows
km.tkeymap('<Esc><Esc>', '<C-\\><C-n>')

----------
---------- Trouble
----------

km.nkeymap('<leader>T', '<cmd>TroubleToggle<cr>', 'Trouble')

----------
---------- Terminal splitter
----------

km.wk.register({ ['<leader>/'] = { name = ' Term Split' } })
km.nkeymap('<leader>/v', '<cmd>vs<cr><cmd>terminal<cr>', 'ﲖ Vertical')
km.nkeymap('<leader>/h', '<cmd>sp<cr><cmd>terminal<cr>', 'ﲐ Horizontal')

----------
---------- Diff View
----------

km.wk.register({ ['<leader>?'] = { name = ' Diff View' } })
km.nkeymap('<leader>?o', '<cmd>DiffviewOpen<cr>', 'DiffviewOpen')
km.nkeymap('<leader>?c', '<cmd>DiffviewClose<cr>', 'DiffviewClose')
km.nkeymap('<leader>?r', '<cmd>DiffviewRefresh<cr>', 'DiffviewRefresh')
km.nkeymap('<leader>?f', '<cmd>DiffviewToggleFiles<cr>', 'DiffviewToggleFiles')

km.nkeymap('<leader>?0', '<cmd>DiffviewOpen HEAD<cr>', 'DiffviewOpen HEAD')
km.nkeymap('<leader>?1', '<cmd>DiffviewOpen HEAD^<cr>', 'DiffviewOpen HEAD^')
km.nkeymap('<leader>?2', '<cmd>DiffviewOpen HEAD^^<cr>', 'DiffviewOpen HEAD^^')
km.nkeymap('<leader>?3', '<cmd>DiffviewOpen HEAD^^^<cr>', 'DiffviewOpen HEAD^^^')
km.nkeymap('<leader>?4', '<cmd>DiffviewOpen HEAD^^^^<cr>', 'DiffviewOpen HEAD^^^^')

km.nkeymap(
    '<leader>?H',
    '<cmd>h nvpunk-shortcuts-diffview<cr>',
    'Show Shortcuts'
)

----------
---------- Context Menu
----------

require'nvpunk.internals.context_menu'.setup_rclick_menu_autocommands()
km.nkeymap('<A-m>', '<cmd>popup PopUp<cr>', 'Open Context Menu')
