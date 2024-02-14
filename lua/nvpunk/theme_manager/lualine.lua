local icons = require 'nvpunk.internals.icons'

local filename_widget = {
    'filename',
    file_status = true,
    newfile_staus = true,
    path = 0,
    symbols = {
        modified = icons.pencil,
        readonly = icons.lock,
        unnamed = '[No Name]',
        newfile = icons.badge_new,
    },
    on_click = function()
        local p = vim.fn.expand('%')
        if p == nil or p == '' then
            return
        end
        vim.fn.setreg('+"', p)
        vim.notify('Copied file path to system clipboard')
    end
}

local diagnostics_widget = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn', 'info', 'hint' },
    symbols = {
        error = icons.diag_error .. ' ',
        warn = icons.diag_warn .. ' ',
        info = icons.diag_info .. ' ',
    },
    on_click = function(_num, btn, _mods)
        if btn == 'l' then
            vim.diagnostic.goto_next()
        elseif btn == 'r' then
            vim.diagnostic.goto_prev()
        end
    end
}

local vsplit_widget = {
    function()
        return icons.win_hsplit
    end,
    on_click = function()
        vim.cmd 'vs'
    end
}

local hsplit_widget = {
    function()
        return icons.win_vsplit
    end,
    on_click = function()
        vim.cmd 'sp'
    end
}

local term_widget = {
    function()
        return icons.shell
    end,
    on_click = function()
        vim.cmd 'ToggleTerm'
    end
}

local styles = {
    powerline = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    plain = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    plain_separators = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '│', right = '│' },
    },
    slant_low = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    slant_high = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    round = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    pixel = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
}

return function(theme)
    local style = styles[require('nvpunk.preferences').get_statusline_style()]
    require('lualine').setup {
        options = {
            theme = theme,
            section_separators = style.section_separators,
            component_separators = style.component_separators,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { filename_widget, diagnostics_widget },
            lualine_x = { 'progress', 'location' },
            lualine_y = { 'encoding', 'fileformat', 'filetype' },
            lualine_z = { vsplit_widget, hsplit_widget, term_widget },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { filename_widget, diagnostics_widget },
            lualine_x = { 'filetype' },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {
            'aerial',
            'neo-tree',
            'nvim-dap-ui',
            'toggleterm',
            'trouble',
        },
    }
end
