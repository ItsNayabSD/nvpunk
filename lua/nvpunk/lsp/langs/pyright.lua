local lspconfig = require 'lspconfig'
local add_to_default = require('nvpunk.lsp.langs.default').add_to_default

return function()
    lspconfig['pyright'].setup(add_to_default {
        settings = {
            python = {
                analysis = {},
            },
        },
    })
end
