return {
    'jay-babu/mason-nvim-dap.nvim',
    config = function()
        local mason_dap = require 'mason-nvim-dap'
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
                    local outFiles = {
                        '${workspaceFolder}/dist/**/*.js',
                        '${workspaceFolder}/build/**/*.js',
                        '${workspaceFolder}/lib/**/*.js',
                        '${workspaceFolder}/public/**/*.js',
                        '${workspaceFolder}/out/**/*.js',
                    }
                    default.node2[1].outFiles = outFiles
                    default.node2[2].outFiles = outFiles

                    return default
                end
            }
        }
        mason_dap.setup_handlers()
    end,
}
