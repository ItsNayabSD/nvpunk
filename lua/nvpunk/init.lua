reload = require'nvpunk.internals.reload'
require'nvpunk.vim_conf'
require'nvpunk.gui_conf'
require'nvpunk.punk_funcs'
require'nvpunk.internals.user_conf'.export_user_conf_path()
require'nvpunk.keymaps'.set_leader()
require'nvpunk.plugin_manager'
require'nvpunk.keymaps'.set_keymaps()
-- require'nvpunk.plugins'
require'nvpunk.internals.context_menu'.setup()
require'nvpunk.internals.user_conf'.user_init()
