vim.cmd([[
  highlight WinSeparator guibg=None
]])

local function setup_status_line()
  require'lualine'.setup {
    options = {
      component_separators = {left = '', right = ''},
      disabled_filetypes = {},
      globalstatus = true,
      icons_enabled = true,
      section_separators = {left = '', right = ''},
      theme = 'auto',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
          sections = { 'error', 'warn', 'info', 'hint'},
          colored = true,
          always_visible = false
        },
        'branch',
      },
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
    'quickfix',
    'nvim-tree',
    'symbols-outline'
  }
}
end

setup_status_line()

