return {
    'mxsdev/nvim-dap-vscode-js',
    config = function()
        if vim.fn.filereadable(vim.fn.stdpath 'data' .. '/vscode-js-debug/out/src/vsDebugServer.js') == 1 then
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
    end,
}
