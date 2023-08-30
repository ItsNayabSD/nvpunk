local M = {}

M.menu = function(items, opts, on_choice)
    vim.ui.select(items, opts, function(item, index)
        if item == nil then return end
        on_choice(item, index)
    end)
end

M.format_get_label = function(i) return i.label end

return M
