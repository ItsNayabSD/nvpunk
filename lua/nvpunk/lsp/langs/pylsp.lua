local lspconfig = require 'lspconfig'
local add_to_default = require('nvpunk.lsp.langs.default').add_to_default

return function()
    lspconfig['pylsp'].setup(add_to_default {
        settings = {
            pylsp = {
                plugins = {
                    rope = {
                        extensionModules = { 'gi' },
                    },
                    jedi = {
                        extra_paths = {},
                    },
                },
            },
        },
    })
end
