require('nvpunk.keymaps').set_keymaps()
require('nvpunk.theme_manager').setup()
require 'nvpunk.internals.numbertoggle_conf'
require('nvpunk.internals.installers.installers_menu').setup()
require('nvpunk.internals.context_menu').setup()
require('nvpunk.internals.user_conf').user_init()
require 'nvpunk.internals.check_updates'()
