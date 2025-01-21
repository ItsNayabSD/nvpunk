return {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
        local dap = require 'dap'
        local mason_dap = require 'mason-nvim-dap'
        mason_dap.setup {
            ensure_installed = {
            },
            automatic_installation = true,
            automatic_setup = {
                configurations = function(default)
                    return default
                end,
            },
        }

        local config = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'VscodeJS: Launch file',
                program = '${file}',
                cwd = '${workspaceFolder}',
            },
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch File (ts-node)',
                cwd = vim.fn.getcwd(),
                runtimeArgs = { '--loader', 'ts-node/esm' },
                runtimeExecutable = 'node',
                args = { '${file}' },
                sourceMaps = true,
                protocol = 'inspector',
                skipFiles = { '<node_internals>/**', 'node_modules/**' },
                console = 'integratedTerminal',
                resolveSourceMapLocations = {
                    '${workspaceFolder}/**',
                    '!**/node_modules/**',
                },
            },
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'npm start',
                cwd = vim.fn.getcwd(),
                runtimeArgs = { 'start' },
                runtimeExecutable = 'npm',
                args = {},
                sourceMaps = true,
                protocol = 'inspector',
                skipFiles = { '<node_internals>/**', 'node_modules/**' },
                console = 'integratedTerminal',
                resolveSourceMapLocations = {
                    '${workspaceFolder}/**',
                    '!**/node_modules/**',
                },
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'VscodeJS: Attach',
                processId = require('dap.utils').pick_process,
                cwd = '${workspaceFolder}',
            },
        }
        for _, lang in ipairs { 'typescript', 'javascript' } do
            local dap_conf = dap.configurations[lang] or {}
            vim.list_extend(dap_conf, config)
            dap.configurations[lang] = dap_conf
        end
    end,
}
