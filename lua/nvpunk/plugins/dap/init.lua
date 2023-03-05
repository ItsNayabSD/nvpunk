local PFX = 'nvpunk.plugins.dap.'
local plugins = {
    'dap',
    'mason_dap',
    'dap_ui',
    'dap_virtual_text',
}

return require('nvpunk.internals.functools').map(
    plugins,
    function(plugin) return require(PFX .. plugin) end
)
