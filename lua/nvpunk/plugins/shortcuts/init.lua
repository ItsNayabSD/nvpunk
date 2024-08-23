local PFX = 'nvpunk.plugins.shortcuts.'
local plugins = {
    'comment',
    'mini_surround',
    'mini_pairs',
    'ultimate_autopair',
    'caser',
    'nvim_ts_autotag',
    'mini_ai',
}

return vim.tbl_map(function(plugin) return require(PFX .. plugin) end, plugins)
