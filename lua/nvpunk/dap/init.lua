-- ensure dap is loaded
local dap = require'dap'

-- redefine signs and relative colors
vim.fn.sign_define(
    'DapBreakpoint',
    {text='', texthl='DiagnosticSignError', linehl='', numhl=''}
)
vim.fn.sign_define(
    'DapBreakpointRejected',
    {text='', texthl='DiagnosticSignWarn', linehl='', numhl=''}
)
vim.fn.sign_define(
    'DapStopped',
    {text='', texthl='GitSignsDelete', linehl='GitSignsDeleteLn', numhl=''}
)

require'nvpunk.dap.dapui_conf'

require'nvpunk.dap.mason_nvim_dap'

-- keymaps

require'nvpunk.dap.keymaps'
