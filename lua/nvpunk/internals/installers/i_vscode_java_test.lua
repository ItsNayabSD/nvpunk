--- Build java debug from git
--- @param java_home string JAVA_HOME absolute path
--- @param cb? function callback function, takes a bool arg indicating success
--- @param reinstall? boolean whether or not to notify on fail (default: false)
return function(java_home, cb, reinstall)
    local Job = require 'plenary.job'

    local env_reinstall = '0'
    if reinstall then
        env_reinstall = '1'
    end

    Job:new({
        command = vim.fn.stdpath 'config'
            .. '/scripts/install_vscode_java_test.sh',
        args = {
            vim.fn.stdpath 'data',
        },
        env = {
            JAVA_HOME = java_home,
            NVPUNK_REINSTALL = env_reinstall
        },
        on_exit = function(_, ret)
            if cb ~= nil then vim.schedule(function() cb(ret == 0) end) end
        end,
    }):start()
end
