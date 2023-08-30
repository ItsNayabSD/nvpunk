--- Build vscode js debug from git
--- @param cb? function callback function
local function build(cb)
    require('nvpunk.internals.installers.i_vscode_js_debug')(function(success)
        if cb ~= nil then
            if success then
                cb()
            else
                vim.print('Failed to install vscode_js_debug')
            end
        end
    end)
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
