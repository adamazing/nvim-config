require'helpers' -- simple helper methods
require'vimopts' -- basic vim/neovim options
require'plugins'

-- plugin options
vim.g.rainbow_active = 1;

vim.g['test#strategy'] = "dispatch"

vim.g.vimspector_enable_mappings = 'HUMAN'

vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug1'}

-- vim-slime options
vim.g.slime_target = "tmux"
-- default target, override with `:SlimeConfig`
vim.cmd( [[
  let g:slime_default_config = { "socket_name": "default", "target_pane": "{right}" }
]] )

-- " TODO Move the following to the nvim tree lua setup
-- " let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
-- " let g:nvim_tree_lsp_diagnostics = 1
-- " let g:nvim_tree_width_allow_resize  = 1
-- " let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`

-- List of filenames that gets highlighted with NvimTreeSpecialFile
-- vim.g['nvim_tree_show_icons'] = { 'git': 1, 'folders': 1, 'files': 1, }

-- TODO:
-- Replace instances of vim.cmd with lua api alternatives as they become available

vim.api.nvim_set_hl(0, "ColorColumn", {guibg = grey; ctermbg = grey})
vim.api.nvim_set_hl(0, "OverLength",  {guibg = red; ctermbg = red})

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

vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')

-- Add mappings for tab line e.g. use `2,` to jump to the second tab
for i=1,9 do
  nmap(i..",", i.."gt")
end

function _G.TrimWhitespace()
  if vim.bo.filetype == "markdown" then
    return
  end
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

local highlight_yank_group = vim.api.nvim_create_augroup( "highlight_yank", { clear = true } )
vim.api.nvim_create_autocmd( {"TextYankPost"}, { group = highlight_yank_group, callback = highlight_on_yank})

-- Used in an interactive rebase, squash all commits into the earliest one then write and exit
function _G.fix_rebase()
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
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
  },
  renderer = {
    special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
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
