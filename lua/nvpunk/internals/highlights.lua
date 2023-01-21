local M = {}

M.HC_HEADER = 'NvpunkHealthcheckHeader'
M.HC_GOOD = 'NvpunkHealthcheckGood'
M.HC_BAD = 'NvpunkHealthcheckBad'
M.RED = 'NvpunkRed'

-- shim for missing highlights
local function set_hl(name, existing)
    vim.api.nvim_set_hl(0, name, { link = existing })
end

M.setup = function()
    -- nvpunk specific
    vim.api.nvim_set_hl(0, M.HC_HEADER, {
        bg = '#f6c177',
        fg = '#191724',
        bold = true,
    })
    vim.api.nvim_set_hl(0, M.HC_GOOD, {
        fg = '#a6d189',
    })
    vim.api.nvim_set_hl(0, M.HC_BAD, {
        fg = '#eb6f92',
    })
    vim.api.nvim_set_hl(0, M.RED, {
        fg = '#eb6f92',
    })

    -- navic highlights
    set_hl('NavicIconsFile', 'WinBar')
    set_hl('NavicIconsModule', 'TSType')
    set_hl('NavicIconsNamespace', 'TSType')
    set_hl('NavicIconsPackage', 'TSInclude')
    set_hl('NavicIconsClass', 'TSType')
    set_hl('NavicIconsMethod', 'TSFunction')
    set_hl('NavicIconsProperty', 'TSProperty')
    set_hl('NavicIconsField', 'TSField')
    set_hl('NavicIconsConstructor', 'TSConstructor')
    set_hl('NavicIconsEnum', 'TSType')
    set_hl('NavicIconsInterface', 'TSType')
    set_hl('NavicIconsFunction', 'TSFunction')
    set_hl('NavicIconsVariable', 'TSVariable')
    set_hl('NavicIconsConstant', 'TSConstant')
    set_hl('NavicIconsString', 'TSString')
    set_hl('NavicIconsNumber', 'TSNumber')
    set_hl('NavicIconsBoolean', 'TSBoolean')
    set_hl('NavicIconsArray', 'TSVariable')
    set_hl('NavicIconsObject', 'TSVariable')
    set_hl('NavicIconsKey', 'TSConstant')
    set_hl('NavicIconsNull', 'TSConstBuiltin')
    set_hl('NavicIconsEnumMember', 'TSProperty')
    set_hl('NavicIconsStruct', 'TSType')
    set_hl('NavicIconsEvent', 'TSFuncBuiltin')
    set_hl('NavicIconsOperator', 'TSOperator')
    set_hl('NavicIconsTypeParameter', 'TSType')
    set_hl('NavicText', 'WinBar')
    set_hl('NavicSeparator', 'WinSeparator')
end

return M
