local M = {}
-- these are filetypes and buftypes that are not actual files
-- created by plugins or by neovim itself

M.filetypes =  {
    'NvimTree',
    'Nvpunk',
    'NvpunkHealthcheck',
    'Outline',
    'TelescopePrompt',
    'Trouble',
    'aerial',
    'alpha',
    'dashboard',
    'help',
    'lazy',
    'lir',
    'neo-tree',
    'neo-tree-popup',
    'neogitstatus',
    'notify',
    'packer',
    'qf',
    'spectre_panel',
    'startify',
    'toggleterm',
    'vim',
}

M.buftypes = {
    'nofile',
    'prompt',
    'quickfix',
    'terminal',
}

return M
