--- Build vscode js debug from git
--- @param cb? function callback function, takes a bool arg indicating success
--- @param reinstall? boolean whether or not to notify on fail (default: false)
return function(cb, reinstall)
    require 'nvpunk.internals.installers.term_install'(
        vim.fn.stdpath 'config'
            .. '/scripts/install_vscode_js_debug.sh '
            .. vim.fn.stdpath 'data',
        reinstall,
        cb
    )
end
