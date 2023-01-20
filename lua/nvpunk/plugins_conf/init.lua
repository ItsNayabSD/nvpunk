local configs = {
    'nvpunk.theme_manager',
    'nvpunk.plugins_conf.mason_conf',
    'nvpunk.lsp',
    'nvpunk.dap',
    'nvpunk.plugins_conf.numbertoggle_conf',  -- numbertoggle is internal, not a plugin
}

local try = require'nvpunk.internals.try'
for _, conf in ipairs(configs) do
    try.require(conf)
end
