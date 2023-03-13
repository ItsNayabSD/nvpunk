return {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
        local dap = require 'dap'
        local mason_dap = require 'mason-nvim-dap'
        local outFiles = require 'nvpunk.plugins.dap.typescript_out_files'
        mason_dap.setup {
            ensure_installed = {
                'node2',
                'codelldb',
                'cppdbg',
                'python',
            },
            automatic_installation = true,
            automatic_setup = {
                configurations = function(default)
                    default.node2[1].outFiles = outFiles
                    default.node2[2].outFiles = outFiles

                    return default
                end,
            },
        }
        mason_dap.setup_handlers()

        local outFiles = require 'nvpunk.plugins.dap.typescript_out_files'
        local config = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'VscodeJS: Launch file',
                program = '${file}',
                cwd = '${workspaceFolder}',
                outFiles = outFiles,
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'VscodeJS: Attach',
                processId = require('dap.utils').pick_process,
                cwd = '${workspaceFolder}',
                outFiles = outFiles,
            },
        }
        for _, lang in ipairs { 'typescript', 'javascript' } do
            local dap_conf = dap.configurations[lang] or {}
            vim.list_extend(dap_conf, config)
            dap.configurations[lang] = dap_conf
        end
    end,
}
