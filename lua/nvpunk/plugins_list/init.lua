local plugins = {
    require'nvpunk.plugins_list.themes',
    require'nvpunk.plugins_list.interface',
    require'nvpunk.plugins_list.tools',
    require'nvpunk.plugins_list.shortcuts',
    require'nvpunk.plugins_list.languages',
    require'nvpunk.plugins_list.lsp',
    require'nvpunk.plugins_list.dap',
    require'nvpunk.plugins_list.mason',
    require'nvpunk.plugins_list.misc',
}

local user_plugins = require'nvpunk.internals.user_conf'.user_plugins()

if user_plugins ~= nil then
    table.insert(plugins, user_plugins)
end

return plugins
