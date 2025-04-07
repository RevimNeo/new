local M = {}

M.revim_transparent = true

function M.toggle_transparency()
  M.revim_transparent = not M.revim_transparent
end

function M.transparency()
  if M.revim_transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
  else
    -- Reload your colorscheme to restore all default backgrounds
    vim.cmd("colorscheme " .. vim.g.colors_name)
  end

  vim.keymap.set("n", "<leader>rt", function ()
    M.toggle_transparency()
    M.transparency()
  end, { desc = 'Toggle Revim transparency' })
end

function M.default()
  require("config.lazy")
  
  M.transparency()

  require("neovim.options")
  require("neovim.keymaps")
end

return M
