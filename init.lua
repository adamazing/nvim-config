-- TODO:
--  Replace instances of vim.cmd with lua api alternatives as they become available
require'helpers' -- simple helper methods
require'vimopts' -- basic vim/neovim options
require'plugins'

vim.g['test#strategy'] = "dispatch"

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

vim.cmd([[cabbrev ff <cmd>lua fix_rebase()<CR>]])

-- Mappings (general - plugin specific mappings live with their respective configs)
require'mappings'

require("completion")             -- all code completion configuration, setup, mappings
require("treesitter")             -- all treesitter configuration (and treesitter extensions)
require("lang")                   -- language specific configurations and LSP setup
require("statusbar")              -- status bar setup and configuration
require("telescope_integration")  -- telescope setup and extension config
require("gitsigns_config")
