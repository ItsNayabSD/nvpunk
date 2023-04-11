-- pretty and better folding
return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    init = function()
        local km = require 'nvpunk.internals.keymapper'

        -- blocked by: https://github.com/neovim/neovim/pull/17446
        -- vim.o.fillchars = [[eob: , fold: , foldopen:, foldsep: , foldclose:]]
        vim.o.foldcolumn = require('nvpunk.preferences').get_folding_guide_enabled()
            and '1'
            or '0'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Using ufo provider need remap `zR` and `zM`
        km.nkeymap('zR', function() require('ufo').openAllFolds() end)
        km.nkeymap('zM', function() require('ufo').closeAllFolds() end)

        vim.opt.fillchars = {
            foldopen = '',
            foldclose = '',
        }
    end,
    config = function()
        require('ufo').setup {
            fold_virt_text_handler = function(
                virtText,
                lnum,
                endLnum,
                width,
                truncate
            )
                local newVirtText = {}
                local suffix = ('     %d '):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix
                                .. (' '):rep(
                                    targetWidth - curWidth - chunkWidth
                                )
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end,
        }
    end,
}
