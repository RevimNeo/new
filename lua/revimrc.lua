local M = {}

M.revim_transparent = true

function M.toggle_transparency()
  M.revim_transparent = not M.revim_transparent
end

function M.transparency(api)
  if M.revim_transparent then
    api.nvim_set_hl(0, "Normal", { bg = "none" })
    api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    api.nvim_set_hl(0, "VertSplit", { bg = "none" })
    api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    api.nvim_set_hl(0, "TabLine", { bg = "none" })
  else
    -- Reload your colorscheme to restore all default backgrounds
    vim.cmd("colorscheme " .. vim.g.colors_name)
  end

  vim.keymap.set("n", "<leader>rt", function ()
    M.toggle_transparency()
    M.transparency(api)
  end, { desc = 'Toggle Revim transparency' })
end

function M.default()
  local api = vim.api
  require("config.lazy")
  require("neovim.options")
  require("neovim.keymaps")

  M.transparency(api)
end

return M
