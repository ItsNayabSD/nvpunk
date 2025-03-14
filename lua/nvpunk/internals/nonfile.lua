local M = {}
-- these are filetypes and buftypes that are not actual files
-- created by plugins or by neovim itself

M.filetypes = {
    'NvimTree',
    'Nvpunk',
    'NvpunkHealthcheck',
    'Outline',
    'TelescopePrompt',
    'Trouble',
    'trouble',
    'aerial',
    'alpha',
    'dap-repl',
    'dapui_breakpoints',
    'dapui_console',
    'dapui_scopes',
    'dapui_stacks',
    'dapui_watches',
    'dashboard',
    'fidget',
    'help',
    'lazy',
    'lir',
    'neo-tree',
    'neo-tree-popup',
    'neogitstatus',
    'noice',
    'notify',
    'packer',
    'qf',
    'spectre_panel',
    'startify',
    'toggleterm',
    'vim',
    'NvMenu',
    'snacks_dashboard',
    'snacks_notif',
    'snacks_notif_history',
}

M.buftypes = {
    'nofile',
    'prompt',
    'quickfix',
    'terminal',
}

return M
