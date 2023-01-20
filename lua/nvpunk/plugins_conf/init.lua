local configs = {
    'nvpunk.theme_manager',
    'nvpunk.plugins_conf.astro_conf',
    'nvpunk.plugins_conf.mason_conf',
    'nvpunk.plugins_conf.neodev_conf',  -- before lspconfig
    'nvpunk.lsp',
    'nvpunk.plugins_conf.autopairs_conf',
    'nvpunk.plugins_conf.aerial_conf',
    -- lualine config done by theme manager
    'nvpunk.dap',
    'nvpunk.plugins_conf.fidget_conf',
    -- 'nvpunk.plugins_conf.noice_conf',
    'nvpunk.plugins_conf.numbertoggle_conf',  -- numbertoggle is internal, not a plugin
}

local try = require'nvpunk.internals.try'
for _, conf in ipairs(configs) do
    try.require(conf)
end
