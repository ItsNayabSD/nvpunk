local PFX = 'nvpunk.plugins.shortcuts.'
local plugins = {
    'comment',
    'autopairs',
    'mini_surround',
    'caser',
}

return vim.tbl_map(
    function(plugin) return require(PFX .. plugin) end,
    plugins
)
