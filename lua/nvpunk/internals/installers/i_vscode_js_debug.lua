--- Build vscode js debug from git
--- @param cb? function callback function, takes a bool arg indicating success
--- @param reinstall? boolean whether or not to notify on fail (default: false)
return function(cb, reinstall)
    local Job = require 'plenary.job'

    local env_reinstall = '0'
    if reinstall then
        env_reinstall = '1'
    end

    Job:new({
        command = vim.fn.stdpath 'config'
            .. '/scripts/install_vscode_js_debug.sh',
        args = {
            vim.fn.stdpath 'data',
        },
        env = {
            NVPUNK_REINSTALL = env_reinstall
        },
        on_exit = function(_, ret)
            if cb ~= nil then vim.schedule(function() cb(ret == 0) end) end
        end,
    }):start()
end
