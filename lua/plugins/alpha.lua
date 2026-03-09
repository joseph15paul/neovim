return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-mini/mini.icons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local ascii = require 'ascii'

    -- Set header
    dashboard.section.header.val = ascii.art.misc.skulls.threeskulls_big_v1
    alpha.setup(dashboard.opts)
  end,
}
