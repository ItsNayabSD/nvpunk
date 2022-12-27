local lsp_confs = {
    'lspconfig',  -- preload lsp config
    'nvpunk.lsp.base_conf',
    'nvpunk.lsp.mason_lsp_conf',
    'nvpunk.lsp.cmp_conf',
    'nvpunk.lsp.signature_conf',
    'nvpunk.lsp.trouble_conf',
    'nvpunk.lsp.null_ls_conf',
}

local try = require'nvpunk.util.try'
for _, conf in ipairs(lsp_confs) do
    try.require(conf)
end

require'nvpunk.lsp.langs.default'.setup'blueprint_ls'
