return {
  'goolord/alpha-nvim',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    local alpha = require 'alpha'
    local startify = require 'alpha.themes.startify'

    startify.section.header.val = {
      ' __________                    ____   _____         ',
      '\\______   \\____   __ ______ __\\   \\ /  /__| _____  ',
      ' |     ___/__  \\ |  |  \\   |  |\\   \\  /|  |/     \\ ',
      ' |    |    / __ \\_  |  /\\___  | \\    / |  |  | |  \\',
      ' |____|   (____  /____/ / ____|  \\  /  |__|__|_|  /',
      '               \\/       \\/        \\/            \\/ ',
    }

    alpha.setup(startify.config)
  end,
}
