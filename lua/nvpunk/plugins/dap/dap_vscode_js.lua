--- Build vscode js debug from git
--- @param cb? function callback function
local function build(cb)
    local Job = require 'plenary.job'

    Job:new({
        command = vim.fn.stdpath 'config'
            .. '/scripts/install_vscode_js_debug.sh',
        args = {
            vim.fn.stdpath 'data',
        },
        on_exit = function (_, ret)
            if ret == 0 then
                if cb ~= nil then vim.schedule(cb) end
            else
                vim.notify(
                    'Failed to install nvim-dap-vscode-js',
                    vim.log.levels.ERROR,
                    { title = 'nvpunk.plugins.dap' }
                )
            end
        end,
    }):start()
end

return {
    'mxsdev/nvim-dap-vscode-js',
    build = build,
    config = function()
        build(
            function()
                require('dap-vscode-js').setup {
                    debugger_path = vim.fn.stdpath 'data' .. '/vscode-js-debug',
                    adapters = {
                        'pwa-node',
                        'pwa-chrome',
                        'pwa-msedge',
                        'node-terminal',
                        'pwa-extensionHost',
                    },
                }
            end
        )
    end,
}
