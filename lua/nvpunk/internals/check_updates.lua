local Job = require 'plenary.job'

Job:new({
    command = vim.fn.stdpath 'config' .. '/scripts/check_updates.sh',
    on_exit = function(_, ret)
        if ret > 0 then
            vim.schedule(function()
                vim.notify('Nvpunk updates available!\nRun :NvpunkUpdate', vim.log.levels.INFO, {
                    title = 'Nvpunk Update'
                })
            end)
        end
    end
}):start()
