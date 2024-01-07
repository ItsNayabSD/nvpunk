local PFX = 'nvpunk.plugins.shortcuts.'
local plugins = {
    'comment',
    'mini_surround',
    'mini_pairs',
    'caser',
}

return vim.tbl_map(
    function(plugin) return require(PFX .. plugin) end,
    plugins
)
