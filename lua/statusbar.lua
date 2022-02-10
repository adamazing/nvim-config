local function setup_status_line()
  require'lualine'.setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = {left = '', right = ''},
      section_separators = {left = '', right = ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diagnostics'},
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      },
      lualine_x = {
        'diff',
        'encoding',
        'fileformat',
        {
          'filetype',
          colored = true,
          icon_only = false,
        }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    'fugitive',
    'nvim-tree',
    'symbols-outline'
  }
}
end

setup_status_line()

