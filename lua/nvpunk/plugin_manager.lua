-- remove packer, remove in the future
require 'nvpunk.internals.rm_packer'()

-- bootstrap lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local FIRST_SYNC
if not vim.loop.fs_stat(lazypath) then
    FIRST_SYNC = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup 'nvpunk.plugins'

local function on_plugins_loaded()
    require('nvpunk.keymaps').set_keymaps()
end

local function on_first_sync_done()
    on_plugins_loaded()
    require'nvpunk.theme_manager'.setup()
end

if FIRST_SYNC then
    vim.api.nvim_create_autocmd({ 'User LazyDone' }, {
        callback = on_first_sync_done,
        group = vim.api.nvim_create_augroup('OnLazyDone', { clear = true }),
    })
else
    on_plugins_loaded()
end
