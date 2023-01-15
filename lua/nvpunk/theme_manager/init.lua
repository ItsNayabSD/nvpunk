local theme = require'nvpunk.preferences'.get_theme()
require'nvpunk.internals.try'.load_theme(theme, function()
    require'nvpunk.theme_manager.theme_chooser'.load_theme(theme, false, false)
end)
