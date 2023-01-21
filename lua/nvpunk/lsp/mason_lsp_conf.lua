local packages = {
    'bashls',
    'cmake',
    'cssls',
    'emmet_ls',
    'html',
    'jdtls',
    'jsonls',
    'ltex',
    'pyright',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
    'vimls',
    'vuels',
    'yamlls',
}

if require('nvpunk.internals.cpu').is_x86_64() then
    vim.tbl_extend('force', packages, {
        'clangd',
        'lemminx',
    })
end

require('mason-lspconfig').setup {
    ensure_installed = packages,
}
require('mason-lspconfig').setup_handlers {
    require('nvpunk.lsp.langs.default').setup,
    ['pyright'] = require 'nvpunk.lsp.langs.pyright',
    ['sumneko_lua'] = require 'nvpunk.lsp.langs.sumneko_lua',
    ['jdtls'] = require 'nvpunk.lsp.langs.nvim_jdtls',
    ['ltex'] = require 'nvpunk.lsp.langs.ltex',
}
