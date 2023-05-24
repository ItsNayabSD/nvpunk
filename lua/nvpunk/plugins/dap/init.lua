local PFX = 'nvpunk.plugins.dap.'
local plugins = {
    'dap',
    'mason_dap',
    'dap_vscode_js',
    'dap_ui',
    'dap_virtual_text',
}

return vim.tbl_map(
    function(plugin) return require(PFX .. plugin) end,
    plugins
)
