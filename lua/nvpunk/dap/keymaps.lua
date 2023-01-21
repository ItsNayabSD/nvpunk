local km = require 'nvpunk.internals.keymapper'

km.wk.register({ ['<leader>b'] = { name = ' Debug' } }, { mode = 'n' })
km.nkeymap('<leader>bb', '<cmd>DapToggleBreakpoint<cr>', 'Toggle Breakpoint')
km.nkeymap('<leader>bc', '<cmd>DapContinue<cr>', 'Continue')
km.nkeymap('<leader>bl', '<cmd>DapShowLog<cr>', 'Show Log')
km.nkeymap('<leader>br', '<cmd>DapToggleRepl<cr>', 'Toggle Repl')
km.nkeymap('<leader>bO', '<cmd>DapStepOut<cr>', 'Step Out')
km.nkeymap('<leader>bi', '<cmd>DapStepInto<cr>', 'Step Into')
km.nkeymap('<leader>bo', '<cmd>DapStepOver<cr>', 'Step Over')
km.nkeymap('<leader>bk', '<cmd>DapTerminate<cr>', 'Terminate')
km.nkeymap('<leader>bu', '<cmd>lua require"dapui".toggle()<cr>', ' DAP UI')
