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

vim.api.nvim_set_keymap('n','<Leader>tw',':Twilight<CR>', {noremap = true, silent = true})

-- show a light-bulb whenever a code action is available
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
