---@diagnostic disable: undefined-global

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function _G.nmap(shortcut, command)
  map('n', shortcut, command)
end

function _G.imap(shortcut, command)
  map('i', shortcut, command)
end

function _G.vmap(shortcut, command)
  map('v', shortcut, command)
end

function _G.xmap(shortcut, command)
  map('x', shortcut, command)
end

function _G.omap(shortcut, command)
  map('o', shortcut, command)
end

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  local line_text = "("..vim.v.foldstart.."-"..vim.v.foldend..")"

  return "     "..line_count.." lines "..line_text.." -[ "..line
end

function _G.contains(tab, val)
  for _,value in ipairs(tab) do
    if value == val then
      return true
    end
  end
end
