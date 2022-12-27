local configs = {
    'nvpunk.theme_manager',
    'nvpunk.keymaps',
    'nvpunk.plugins_conf.notify_config',
    'nvpunk.plugins_conf.webdevicons_conf',
    'nvpunk.plugins_conf.highlight_colors_conf',
    'nvpunk.plugins_conf.emmet_conf',
    'nvpunk.plugins_conf.astro_conf',
    'nvpunk.plugins_conf.treesitter_conf',
    'nvpunk.plugins_conf.mason_conf',
    'nvpunk.lsp',
    'nvpunk.plugins_conf.autopairs_conf',
    'nvpunk.plugins_conf.aerial_conf',
    -- lualine config done by theme manager
    'nvpunk.plugins_conf.bufferline_conf',
    'nvpunk.plugins_conf.comment_conf',
    'nvpunk.plugins_conf.neotree_conf',
    'nvpunk.plugins_conf.whichkey_conf',
    'nvpunk.plugins_conf.telescope_conf',
    'nvpunk.plugins_conf.toggleterm_conf',
    'nvpunk.plugins_conf.gitsigns_conf',
    'nvpunk.plugins_conf.alpha_conf',
    'nvpunk.plugins_conf.mini_surround_conf',
    'nvpunk.plugins_conf.dressing_conf',
    'nvpunk.plugins_conf.navic_conf',
    'nvpunk.dap',
    'nvpunk.plugins_conf.ufo_conf',
    'nvpunk.plugins_conf.fidget_conf',
    'nvpunk.plugins_conf.indent_blankline_conf',
    'nvpunk.plugins_conf.bqf_conf',
    -- 'nvpunk.plugins_conf.noice_conf',
}

local try = require'nvpunk.util.try'
for _, conf in ipairs(configs) do
    try.require(conf)
end
