if vim.bo.ft == 'NvMenu' then
    local bkm = require('nvpunk.internals.keymapper').create_bufkeymapper(vim.fn.bufnr())
    for _, num in ipairs { '2-', '3-', '4-' } do
        bkm.inkeymap('<' .. num .. 'LeftMouse>', function()
            -- do nothing
        end)
    end
end
