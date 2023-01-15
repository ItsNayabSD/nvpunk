local M = {}

M.nvpunk_update = function()
    vim.notify('Updating Nvpunk...', vim.log.levels.INFO, {
        title = 'Nvpunk Update'
    })
    require'plenary.job':new({
        command = '/usr/bin/git',
        args = {
            '-C', vim.fn.stdpath'config',
            'pull'
        },
        on_exit = function(_, res)
            if res == 0 then
                vim.notify('Nvpunk updated', vim.log.levels.INFO, {
                    title = 'Nvpunk Update'
                })
                vim.schedule(function()
                    vim.cmd(
                        'source ' ..
                        vim.fn.stdpath'config' ..
                        '/lua/nvpunk/plugins.lua'
                        )
                    require'packer'.sync()
                end)
            else
                vim.notify('Nvpunk update failed', vim.log.levels.ERROR, {
                    title = 'Nvpunk Update'
                })
            end
        end
    }):start()
end

vim.api.nvim_create_user_command(
    'NvpunkUpdate',
    function(_) M.nvpunk_update() end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'NvpunkHealthcheck',
    function(_) require'nvpunk.util.healthcheck'() end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'NvpunkExplorerToggle',
    function(_) vim.cmd'Neotree toggle' end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'NvpunkExplorerOpen',
    function(_) vim.cmd'Neotree reveal' end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'NvpunkExplorerClose',
    function(_) vim.cmd'Neotree close' end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'NvpunkNewFileDialog',
    function(_)
        vim.ui.input(
            {
                prompt = 'New file path',
            },
            function(txt)
                if txt == nil then return end
                txt = vim.trim(txt)
                if txt == '' then return end
                vim.cmd('e ' .. txt)
            end
        )
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'NvpunkReinstallJavaTools',
    function(_)
        local j = require'nvpunk.lsp.jdtls_conf'
        j.remove_extra_java_tools(function()
            j.setup()
        end)
    end,
    { nargs = 0 }
)

return M
