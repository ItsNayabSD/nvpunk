-- remove packer, remove in the future
require'nvpunk.internals.rm_packer'()

-- bootstrap lazy
local lazypath = vim.fn.stdpath'data' .. '/lazy/lazy.nvim'
local FIRST_SYNC
if not vim.loop.fs_stat(lazypath) then
    FIRST_SYNC = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup'nvpunk.plugins'

if FIRST_SYNC then
    vim.api.nvim_create_autocmd(
        { 'User LazyDone' }, {
            callback = function() require'nvpunk.plugins_conf' end,
            group = vim.api.nvim_create_augroup('OnLazyDone', { clear = true })
        }
    )
else
    require'nvpunk.plugins_conf'
end
