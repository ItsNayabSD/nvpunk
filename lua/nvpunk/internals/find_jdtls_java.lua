local Job = require'plenary.job'

--- Find java executable for jdtls, so version 17 or later
---@param cb function[string]
return function(cb)
    Job:new({
        command = 'python3',
        args = {vim.fn.stdpath'config' .. '/find_jdtls_java.py'},
        on_stdout = function(_, data)
            vim.schedule(function()
                cb(data)
            end)
        end
    }):start()
end
