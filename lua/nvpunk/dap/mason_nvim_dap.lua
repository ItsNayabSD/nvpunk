-- require'mason'.setup() done elsewhere
local mason_dap = require 'mason-nvim-dap'
mason_dap.setup {
    ensure_installed = {
        'node2',
        'codelldb',
        'cppdbg',
        'python',
    },
    automatic_installation = true,
    automatic_setup = true,
}
mason_dap.setup_handlers()
