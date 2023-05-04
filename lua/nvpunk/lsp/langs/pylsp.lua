local lspconfig = require 'lspconfig'
local add_to_default = require('nvpunk.lsp.langs.default').add_to_default

local gistubgen_out_path = vim.fn.expand '$HOME/git/gi-stubgen/out'
if not vim.fn.isdirectory(gistubgen_out_path) then gistubgen_out_path = '' end

local pygobject_stubs_path = vim.fn.expand '$HOME/.cache/pygobject-stubs'
if not vim.fn.isdirectory(pygobject_stubs_path) then pygobject_stubs_path = '' end

return function()
    lspconfig['pylsp'].setup(add_to_default {
        settings = {
            pylsp = {
                plugins = {
                    rope = {
                        extensionModules = {'gi'},
                    },
                    jedi = {
                        extra_paths = {
                            -- gistubgen_out_path,
                            pygobject_stubs_path,
                        }
                    },
                },
            },
        },
    })
end
