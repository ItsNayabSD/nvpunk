local M = {}

local icons = require 'nvpunk.internals.icons'

M.lsp_signs = {
    {
        name = 'DiagnosticSignError',
        text = icons.diag_error,
        texthl = 'DiagnosticSignError',
    },
    {
        name = 'DiagnosticSignWarn',
        text = icons.diag_warn,
        texthl = 'DiagnosticSignWarn',
    },
    {
        name = 'DiagnosticSignInfo',
        text = icons.diag_info,
        texthl = 'DiagnosticSignInfo',
    },
    {
        name = 'DiagnosticSignHint',
        text = icons.diag_hint,
        texthl = 'DiagnosticSignHint',
    },
}

M.dap_signs = {
    { name = 'DapBreakpoint', text = icons.debug_breakpoint, texthl = 'DiagnosticSignError' },
    {
        name = 'DapBreakpointRejected',
        text = icons.debug_rejected,
        texthl = 'DiagnosticSignWarn',
    },
    {
        name = 'DapStopped',
        text = icons.debug_stopped,
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
