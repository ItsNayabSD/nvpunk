--- Build java debug from git
--- @param java_home string JAVA_HOME absolute path
--- @param cb? function callback function, takes a bool arg indicating success
--- @param reinstall? boolean whether or not to notify on fail (default: false)
return function(java_home, cb, reinstall)
    require 'nvpunk.internals.installers.term_install'(
        vim.fn.stdpath 'config'
            .. '/scripts/install_vscode_java_test.sh '
            .. vim.fn.stdpath 'data',
        reinstall,
        cb
    )
end
