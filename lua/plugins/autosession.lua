return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>ss', '<cmd>SessionSearch<CR>',         desc = 'Session search' },
    { '<leader>sw', '<cmd>SessionSave<CR>',           desc = 'Save session' },
    { '<leader>st', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  }
}
