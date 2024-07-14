-- For quickly switching between camel and snake case etc
local modes = { 'n', 'v', 'x', 's' }
return {
    'arthurxavierx/vim-caser',
    lazy = true,
    init = function()
        require('which-key').add {
            { 'gs', mode = modes, group = 'Change Case' },
        }
    end,
    keys = {
        { 'gsm', mode = modes, desc = 'PascalCase' },
        { 'gsp', mode = modes, desc = 'PascalCase' },
        { 'gsc', mode = modes, desc = 'camelCase' },
        { 'gs_', mode = modes, desc = 'snake_case' },
        { 'gsu', mode = modes, desc = 'UPPER_CASE' },
        { 'gsU', mode = modes, desc = 'UPPER_CASE' },
        { 'gst', mode = modes, desc = 'Title Case' },
        { 'gss', mode = modes, desc = 'Sentence case' },
        { 'gs<space>', mode = modes, desc = 'space case' },
        { 'gs-', mode = modes, desc = 'kebab-case' },
        { 'gsk', mode = modes, desc = 'kebab-case' },
        { 'gsK', mode = modes, desc = 'Title-Kebab-Case' },
        { 'gs.', mode = modes, desc = 'dot.case' },
    },
}
