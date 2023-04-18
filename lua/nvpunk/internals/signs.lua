local M = {}

M.lsp_signs = {
    {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
    },
    {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
    },
    {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
    },
    {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
    },
}

M.dap_signs = {
    { name = 'DapBreakpoint', text = '', texthl = 'DiagnosticSignError' },
    {
        name = 'DapBreakpointRejected',
        text = '',
        texthl = 'DiagnosticSignWarn',
    },
    {
        name = 'DapStopped',
        text = '',
        texthl = 'GitSignsDelete',
        linehl = 'GitSignsDeleteLn',
    },
}

M.setup = function()
    local signs = {}
    for _, group in ipairs { M.lsp_signs, M.dap_signs } do
        vim.list_extend(signs, group)
    end
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.texthl or sign.name,
            text = sign.text,
            numhl = sign.numl or '',
            linehl = sign.linehl or '',
        })
    end
end

return M
