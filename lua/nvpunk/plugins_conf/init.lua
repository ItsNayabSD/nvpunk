local configs = {
    'nvpunk.theme_manager',
    'nvpunk.dap',
}

local try = require 'nvpunk.internals.try'
for _, conf in ipairs(configs) do
    try.require(conf)
end
