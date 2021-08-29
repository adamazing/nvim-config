---@diagnostic disable: undefined-global
require('nvim-web-devicons').setup {
  -- your personal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      name = "Zsh"
    }
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}

require("twilight").setup {
  dimming = {
    alpha = 0.15, -- amount of dimming
    color = { "Normal", "#111111" }
  },
}

-- require('lualine').setup {
--   -- options = { theme = 'gruvbox' }
-- }


vim.api.nvim_set_keymap('n','<Leader>tw',':Twilight<CR>', {noremap = true, silent = true})
