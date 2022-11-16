vim.cmd([[
  highlight WinSeparator guibg=None
]])

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function setup_status_line()
  require'lualine'.setup {
    options = {
      component_separators = {left = '', right = ''},
      disabled_filetypes = {},
      globalstatus = true,
      icons_enabled = true,
      section_separators = {left = '', right = ''},
      theme = 'gruvbox-material',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        {
          'diagnostics',
          sources = { 'nvim_lsp','nvim_diagnostic' },
          sections = { 'error', 'warn', 'info', 'hint'},
          colored = true,
          always_visible = false
        },
        {
          'branch',
          fmt = function(str)
            if str:len() > 45 then
              return str:sub(1,15) .. '...' .. str:sub(str:len()-10,str:len())
            else
              return str
            end
          end
        },
      },
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      },
      lualine_x = {
        {
          'diff',
          source = diff_source
        },
      },
      lualine_y = {
        {
          'filetype',
          colored = true,
          icon_only = false,
        }
      },
      lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {
      'encoding',
      'fileformat',
    },
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    'fugitive',
    'quickfix',
    'nvim-tree',
--    'symbols-outline'
  }
}
end

setup_status_line()

