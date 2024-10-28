local nonfile = require('nvpunk.internals.nonfile').filetypes
local icons = require 'nvpunk.internals.icons'

local function shcut(name, cmd)
    return {
        name = name,
        cmd = function()
            vim.cmd.exec(
                '"norm '
                    .. string.gsub(
                        string.gsub(cmd, '<space>', '1<space>'),
                        '<',
                        '\\<'
                    )
                    .. '"'
            )
        end,
        rtxt = cmd,
    }
end

local menus = {
    default = {
        {
            name = icons.language .. ' Language Server',
            items = {
                shcut('Code actions', '<space>ca'),
                shcut('Go to definition', 'gdt'),
                shcut('Signature help', '<C-k>'),
                shcut('Rename symbol', '<space>rn'),
                shcut('References', 'gr'),
                shcut('Expand diagnostic', '<space>e'),
                shcut('Format', '<space>f'),
            },
        },
        shcut(icons.bug .. ' Debug Mode', '<space>bu'),
        shcut(icons.telescope .. ' Find file', '<space>tf'),
        shcut(icons.telescope .. ' Live grep', '<space>tg'),
        {
            name = icons.git .. ' Git',
            items = {
                shcut('Preview changes', '<space>g?'),
                shcut('Blame line', '<space>gb'),
                {
                    name = 'Reset hunk',
                    cmd = function() require('gitsigns').reset_hunk() end,
                },
                {
                    name = 'Stage hunk',
                    cmd = function() require('gitsigns').stage_hunk() end,
                },
                {
                    name = 'Reset file',
                    cmd = function() require('gitsigns').reset_buffer() end,
                },
            },
        },
        {
            name = 'View',
            items = {
                shcut('Code outline', 'go'),
                shcut('Terminal right', '<space>/s'),
                shcut('Terminal down', '<space>/i'),
                shcut('Toggle file tree', 'ge'),
            },
        },
    },
    filetree = {
        shcut('New file', '<space>fn'),
        shcut('New directory', '<space>dn'),
        shcut('Rename', '<F2>'),
        shcut('Toggle hidden files', '<C-h>'),
        shcut('Split down', 'i'),
        shcut('Split right', 's'),
        shcut('Open in new tab', 't'),
        shcut('Open with system app', '<space>xo'),
        { name = 'separator' },
        shcut('Git add', '<space>ga'),
        shcut('Git unstage', '<space>gu'),
    },
    -- nonfile = {
    --     shcut(icons.telescope .. ' Find file', '<space>tf'),
    --     shcut(icons.telescope .. ' Live grep', '<space>tg'),
    -- },
}

---@param mouse boolean
local function open_menu(mouse)
    local menu = menus.default
    if vim.bo.ft == 'neo-tree' then
        menu = menus.filetree
    elseif vim.tbl_contains(nonfile, vim.bo.ft) then
        return
    end
    require('menu').open(menu, { mouse = mouse })
end

return {
    'nvchad/menu',
    dependencies = {
        'nvchad/volt',
    },
    lazy = true,
    init = function()
        -- kb shortcut
        vim.keymap.set('n', '<A-m>', function() open_menu(false) end, {
            desc = 'Open Context Menu',
            noremap = true,
            silent = true,
        })

        for _, num in ipairs { '', '2-', '3-', '4-' } do
            vim.keymap.set('n', '<' .. num .. 'RightMouse>', function()
                vim.cmd.exec '"normal! \\<RightMouse>"'
                open_menu(true)
            end, { noremap = true, silent = true })
        end
    end,
}
