local Job = require 'plenary.job'

--- Get version of given java executable
---@param java_exec string valid java exectuable path
---@return number
local function get_version(java_exec)
    local ok, res = pcall(function()
        local lines = vim.fn.systemlist { java_exec, '-version' }
        lines = vim.tbl_filter(
            function(line)
                return (
                    string.find(line, 'version') ~= nil
                    and string.find(line, '"') ~= nil
                    and string.find(line, '.') ~= nil
                )
            end,
            lines
        )
        local line = lines[1]
        if line == nil then return 0 end
        line = vim.fn.split(line, '"')[2]
        line = vim.fn.split(line, '\\.')[1]
        return tonumber(line)
    end)
    if not ok then return 0 end
    return res or 0
end

local JVM_DIR = '/usr/lib/jvm/'
local TARGET_VERSION = 17

local function get_viable_version()
    local iter = vim.loop.fs_scandir(JVM_DIR)
    if iter == nil then return nil end
    local item, type = vim.loop.fs_scandir_next(iter)
    while item ~= nil do
        if type == 'directory' then
            local jhome = JVM_DIR .. item
            if get_version(jhome .. '/bin/java') == TARGET_VERSION then
                return jhome
            end
        end
        item, type = vim.loop.fs_scandir_next(iter)
    end
    return nil
end

--- Find java executable for jdtls, so version 17 or later
---@param cb function[string]
---@param notify? boolean
return function(cb, notify)
    local jhome = get_viable_version()
    if notify == nil then notify = true end
    if jhome == nil and notify then
        vim.notify(
            'Java version 17 not found',
            vim.log.levels.WARN,
            { title = 'nvpunk.internals.find_jdtls_java' }
        )
    end
    if jhome then cb(jhome) end
end
