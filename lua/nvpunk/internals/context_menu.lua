local M = {}

--- Checks if current buf has LSPs attached
---@return boolean
M.buf_has_lsp = function()
    return not vim.tbl_isempty(vim.lsp.get_active_clients {
        bufnr = vim.api.nvim_get_current_buf(),
    })
end

local nonfile_bufs = require 'nvpunk.internals.nonfile_buffers'

--- Checks if current buf is a file
---@return boolean
M.buf_is_file = function()
    return not vim.tbl_contains(nonfile_bufs, vim.bo.filetype)
end

--- Checks if current buf has DAP support
---@return boolean
M.buf_has_dap = function() return M.buf_is_file() end

--- Create a context menu
---@deprecated
---@param prompt string
---@param strings table[string]
---@param funcs table[function]
M.uiselect_context_menu = function(prompt, strings, funcs)
    vim.ui.select(
        strings,
        { prompt = prompt },
        function(_, idx) vim.schedule(funcs[idx]) end
    )
end

local MODES = { 'i', 'n' }

--- Clear all entries from the given menu
---@param menu string
M.clear_menu = function(menu)
    pcall(function() vim.cmd('aunmenu ' .. menu) end)
end

--- Formats the label of a menu entry to avoid errors
---@param label string
---@return string
M.format_menu_label = function(label)
    local res = string.gsub(label, ' ', [[\ ]])
    res = string.gsub(res, '<', [[\<]])
    res = string.gsub(res, '>', [[\>]])
    return res
end

--- Create an entry for the right click menu
---@param menu string
---@param label string
---@param action string
M.rclick_context_menu = function(menu, label, action)
    for _, m in ipairs(MODES) do
        vim.cmd(
            m
                .. 'menu '
                .. menu
                .. '.'
                .. M.format_menu_label(label)
                .. ' '
                .. action
        )
    end
end

--- Set up a right click submenu
---@param menu_name string
---@param submenu_label string
---@param items table[{string, string}]
---@param bindif function?
M.set_rclick_submenu = function(menu_name, submenu_label, items, bindif)
    M.clear_menu(menu_name)
    M.clear_menu('PopUp.' .. M.format_menu_label(submenu_label))
    if bindif ~= nil then
        if not bindif() then return end
    end
    for _, i in ipairs(items) do
        M.rclick_context_menu(menu_name, i[1], i[2])
    end
    M.rclick_context_menu(
        'PopUp',
        submenu_label,
        '<cmd>popup ' .. menu_name .. '<cr>'
    )
end

M.MENU_ITEM_WIDTH = 32

---create a table representing a menu item
---@param label string
---@param shortcut string
---@return table[string, string]
M.menu_item = function(label, shortcut)
    local padding = M.MENU_ITEM_WIDTH - #label - #shortcut
    if padding < 1 then  -- no max function in lua?
        padding = 1
    end
    return {
        label .. string.rep(' ', padding) .. shortcut,
        shortcut
    }
end

M.set_lsp_rclick_menu = function()
    M.set_rclick_submenu('NvpunkLspMenu', 'LSP         ', {
        M.menu_item('Code Actions', '<space>ca'),
        M.menu_item('Go to Declaration', 'gD'),
        M.menu_item('Go to Definition', 'gd'),
        M.menu_item('Go to Implementation', 'gI'),
        M.menu_item('Signature Help', '<C-k>'),
        M.menu_item('Rename', '<space>rn'),
        M.menu_item('References', 'gr'),
        M.menu_item('Expand Diagnostics', '<space>e'),
        M.menu_item('Auto Format', '<space>f'),
    }, M.buf_has_lsp)
end

M.set_java_rclick_menu = function()
    M.set_rclick_submenu('NvpunkJavaMenu', 'Java        ', {
        M.menu_item('Test Class', '<space>bjc'),
        M.menu_item('Test Nearest Method', '<space>bjn'),
        M.menu_item('Refresh Debugger', '<space>bjr'),
    }, function() return vim.bo.filetype == 'java' end)
end

M.set_dap_rclick_menu = function()
    M.set_rclick_submenu('NvpunkDapMenu', 'Debug       ', {
        M.menu_item('Show DAP UI', '<space>bu'),
        M.menu_item('Toggle Breakpoint', '<space>bb'),
        M.menu_item('Continue', '<space>bc'),
        M.menu_item('Terminate', '<space>bk'),
    }, M.buf_has_dap)
end

-- M.set_nvimtree_rclick_menu = function()
--     M.set_rclick_submenu('NvpunkFileTreeMenu', 'File        ', {
--         {'New File              <space>fn',   '<space>fn'},
--         {'Rename                     <F2>',   '<F2>'},
--     }, function() return vim.bo.filetype == 'NvimTree' end)
-- end

M.set_neotree_rclick_menu = function()
    M.set_rclick_submenu('NvpunkNeoTreeMenu', 'File        ', {
        M.menu_item('New File', '<space>fn'),
        M.menu_item('New Folder', '<space>dn'),
        M.menu_item('Rename', '<F2>'),
        M.menu_item('Toggle Hidden', '<C-h>'),
        M.menu_item('Split Horizontally', 'i'),
        M.menu_item('Split Vertically', 's'),
        M.menu_item('Open in New Tab', 't'),
        M.menu_item('Open with System App', '<space>xo'),
        M.menu_item('Git Add', '<space>ga'),
        M.menu_item('Git Unstage', '<space>gu'),
    }, function() return vim.bo.filetype == 'neo-tree' end)
end

M.set_telescope_rclick_menu = function()
    M.set_rclick_submenu('NvpunkTelescopeMenu', 'Telescope   ', {
        M.menu_item('Find File', '<space>tf'),
        M.menu_item('Live Grep', '<space>tg'),
        M.menu_item('Recent Files', '<space>th'),
    })
end

M.set_git_rclick_menu = function()
    M.set_rclick_submenu('NvpunkGitMenu', 'Git         ', {
        M.menu_item('Preview Changes', '<space>g?'),
        M.menu_item('Prev Hunk', '<space>g['),
        M.menu_item('Next Hunk', '<space>g]'),
        M.menu_item('Blame Line', '<space>gb'),
    }, M.buf_is_file)
end

M.setup_rclick_menu_autocommands = function()
    vim.api.nvim_create_autocmd({ 'BufEnter', 'LspAttach' }, {
        callback = function()
            M.set_lsp_rclick_menu()
            M.set_dap_rclick_menu()
            M.set_java_rclick_menu()
            -- M.set_nvimtree_rclick_menu()
            M.set_neotree_rclick_menu()
            M.set_telescope_rclick_menu()
            M.set_git_rclick_menu()
        end,
    })
end

M.clear_menu 'PopUp'

M.set_keymap = function()
    require('nvpunk.internals.keymapper').nkeymap(
        '<A-m>',
        '<cmd>popup PopUp<cr>',
        'Open Context Menu'
    )
end

M.setup = function()
    M.setup_rclick_menu_autocommands()
    M.set_keymap()
end

return M
