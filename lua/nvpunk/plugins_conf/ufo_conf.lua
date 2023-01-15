local km = require'nvpunk.internals.keymapper'

-- blocked by: https://github.com/neovim/neovim/pull/17446
-- vim.o.fillchars = [[eob: , fold: , foldopen:, foldsep: , foldclose:]]
vim.o.foldcolumn = require'nvpunk.preferences'.get_folding_guide_enabled() and '1' or '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`
km.nkeymap('zR', require'ufo'.openAllFolds)
km.nkeymap('zM', require'ufo'.closeAllFolds)

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
---- folding capabilities in nvpunk.lsp.capabilities


require('ufo').setup()

-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
--
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
-- })


-- Option 4: disable all providers for all buffers
-- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return ''
--     end
-- })
