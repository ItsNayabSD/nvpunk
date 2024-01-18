local menu = require('nvpunk.internals.menu').menu
local format_get_label = require('nvpunk.internals.menu').format_get_label
local notif_ctx = 'Nvpunk Installers'

local M = {}

local installers_menus = {
    {
        label = 'VSCode JS Debug',
        func = function()
            vim.notify('Installing VSCode JS Debug...', vim.log.levels.INFO, {
                title = notif_ctx
            })
            vim.notify('DO NOT CLOSE NEOVIM!', vim.log.levels.ERROR, {
                title = notif_ctx
            })
            require('nvpunk.internals.installers.i_vscode_js_debug')(function(success)
                if success then
                    vim.notify('VSCode JS Debug Installed', vim.log.levels.INFO, {
                        title = notif_ctx
                    })
                else
                    vim.notify('Failed to install VSCode JS Debug', vim.log.levels.ERROR, {
                        title = notif_ctx
                    })
                end
            end, true
            )
        end,
    }
}

M.installers_menu = function()
    menu(installers_menus, {
        prompt = 'Installers:',
        format_item = format_get_label
    }, function(item, _) item.func() end)
end

M.setup = function()
    vim.api.nvim_create_user_command(
        'NvpunkInstallers',
        function(_) M.installers_menu() end,
        { nargs = 0 }
    )
end

return M
