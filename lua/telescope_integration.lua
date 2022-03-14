require("trouble").setup {
  auto_close = true
}

-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        --
      }
    },
  },
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }
  },
}

require("telescope").load_extension("ui-select")
