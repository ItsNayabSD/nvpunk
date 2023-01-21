require('mason-lspconfig').setup {
    ensure_installed = {
        'bashls',
        'clangd',
        'cmake',
        'cssls',
        'emmet_ls',
        'html',
        'jdtls',
        'jsonls',
        'lemminx',
        'ltex',
        'pyright',
        'rust_analyzer',
        'sumneko_lua',
        'tsserver',
        'vimls',
        'vuels',
        'yamlls',
    },
}
require('mason-lspconfig').setup_handlers {
    require('nvpunk.lsp.langs.default').setup,
    ['pyright'] = require 'nvpunk.lsp.langs.pyright',
    ['sumneko_lua'] = require 'nvpunk.lsp.langs.sumneko_lua',
    ['jdtls'] = require 'nvpunk.lsp.langs.nvim_jdtls',
    ['ltex'] = require 'nvpunk.lsp.langs.ltex',
}
