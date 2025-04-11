return {
  "echasnovski/mini.notify",
  version = '*',
  config = function()
    local notify = require('mini.notify')
    notify.setup({
      window = {
        winblend = 0
      },
      background_colour = "#000000"
    })

    vim.notify = notify.make_notify({
      ERROR = { duration = 5000 },
      WARN = { duration = 4000 },
      INFO = { duration = 3000 }
    })

    vim.notify('Notification daemon loaded.', vim.log.levels.INFO)
  end
}
