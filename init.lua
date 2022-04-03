require'helpers' -- simple helper methods
require'vimopts' -- basic vim/neovim options
require'plugins'

-- plugin options
vim.g.rainbow_active = 1;
vim.g.ruby_host_prog = 'asdf exec neovim-ruby-host'

vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }

vim.g['test#strategy'] = "dispatch"

vim.g.vimspector_enable_mappings = 'HUMAN'

vim.g.gruvbox_contrast_light = 'hard'
vim.g.gruvbox_contrast_dark = 'soft'

vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug1'}

-- " TODO Move the following to the nvim tree lua setup
-- " let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
-- " let g:nvim_tree_lsp_diagnostics = 1
-- " let g:nvim_tree_width_allow_resize  = 1
-- " let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`

-- List of filenames that gets highlighted with NvimTreeSpecialFile
-- vim.g['nvim_tree_show_icons'] = { 'git': 1, 'folders': 1, 'files': 1, }

-- TODO:
-- Replace instances of vim.cmd with lua api alternatives as they become available

vim.cmd([[
  highlight ColorColumn ctermbg=grey guibg=grey
  highlight OverLength ctermbg=red guibg=red
]])

function _G.MatchOverLength()
  vim.cmd('match OverLength /\\%151v.\\+/')
end

local overlength_augroup = vim.api.nvim_create_augroup("overlength_cmds", { clear = true})
vim.api.nvim_create_autocmd( {"BufEnter", "InsertLeave"}, { callback = MatchOverLength, group = overlength_augroup})

function _G.over_length()
  local ignore_filetypes_over_length = { "csv" }
  if contains(ignore_filetypes_over_length, vim.bo.filetype) == true then
    print("Filetype: "..vim.bo.filetype)
  end
end
--  vim.api.highlight

vim.cmd('colorscheme gruvbox')

-- Add mappings for tab line e.g. use `2,` to jump to the second tab
for i=1,9 do
  nmap(i..",", i.."gt")
end

function _G.TrimWhitespace()
  local patterns = { [[%s/\s\+$//e]], }
  local save = vim.fn.winsaveview()
  for _, p in pairs(patterns) do
    vim.api.nvim_exec(string.format("keeppatterns silent! %s", p), false)
  end
  vim.fn.winrestview(save)
end

-- pre save action
local pre_save_augroup = vim.api.nvim_create_augroup( "presave_cmds", { clear = true} )
vim.api.nvim_create_autocmd( {"BufWritePre"}, { callback = TrimWhitespace, group = pre_save_augroup})

function _G.highlight_on_yank()
  require'vim.highlight'.on_yank()
end

local hightlight_yank_group = vim.api.nvim_create_augroup( "highlight_yank", { clear = true } )
vim.api.nvim_create_autocmd( {"TextYankPost"}, { group = hightlight_yank_group, callback = highlight_on_yank})

-- Used in an interactive rebase, squash all commits into the earliest one then write and exit
function fix_rebase()
  vim.cmd([[
  :2,$s/^pick /f /
  :wq
  ]])
end

vim.cmd([[
cabbrev ff <cmd>lua fix_rebase()<CR>
]])

-- Mappings
require'mappings'

require'nvim-tree'.setup {
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  view = {
    lsp_diagnostics = true,
  }
}

-- not shown: defaults
require'regexplainer'.setup {
  -- automatically show the explainer when the cursor enters a regexp
  auto = true,
  popup = {
    border = {
      padding = { 1, 2},
      style="rounded"
    },
  },
  narrative = {
    separator = function(component)
      local sep = '\n ';
      if component.depth > 0 then
        for _ = 1, component.depth do
          sep = sep .. '> '
        end
      end
      return sep
    end
  },
}

require("completion")
require("treesitter")
require("lang")
require("statusbar")
require("telescope_integration")
require("prettiness")