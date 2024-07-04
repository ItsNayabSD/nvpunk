local M = {}
local augroup_name = 'numbertoggle'

-- code from
-- https://github.com/sitiom/nvim-numbertoggle/blob/main/plugin/numbertoggle.lua

local function enable_relativenumber()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
        vim.opt.relativenumber = true
    end
end

M.create = function()
    M.delete()
    local augroup = vim.api.nvim_create_augroup(augroup_name, {})
    vim.api.nvim_create_autocmd(
        { 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' },
        {
            pattern = '*',
            group = augroup,
            callback = enable_relativenumber,
        }
    )

    vim.api.nvim_create_autocmd(
        { 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' },
        {
            pattern = '*',
            group = augroup,
            callback = function()
                if vim.o.nu then
                    vim.opt.relativenumber = false
                    vim.cmd 'redraw'
                end
            end,
        }
    )

    if
        not vim.tbl_contains(
            require('nvpunk.internals.nonfile').filetypes,
            vim.bo.filetype
        )
    then
        enable_relativenumber()
    end
end

M.delete = function()
    pcall(function() vim.api.nvim_del_augroup_by_name(augroup_name) end)
    vim.opt.relativenumber = false
end

return M
