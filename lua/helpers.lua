---@diagnostic disable: undefined-global

_G.keymap = vim.keymap.set

function _G.map(mode, shortcut, command, options)
  local default_opts = { noremap = true, silent = true, expr = false }
  local keymap_opts = vim.tbl_deep_extend('force', default_opts, options or {})
  keymap(mode, shortcut, command, keymap_opts)
end

function _G.nmap(shortcut, command, options)
  map('n', shortcut, command, options)
end

function _G.imap(shortcut, command, options)
  map('i', shortcut, command, options)
end

function _G.vmap(shortcut, command, options)
  map('v', shortcut, command, options)
end

function _G.xmap(shortcut, command, options)
  map('x', shortcut, command, options)
end

function _G.omap(shortcut, command, options)
  map('o', shortcut, command, options)
end

function _G.maprm(modes, lhs)
  vim.keymap.del(modes, lhs)
end

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  local line_text = "("..vim.v.foldstart.."-"..vim.v.foldend..")"

  return "     "..line_count.." lines "..line_text.." -[ "..line
end

function _G.toggle(key)
  vim.g[key] = not vim.g[key]
end

function _G.toggle_opt(option)
  vim.opt[option] = not vim.opt[option]
end

function _G.contains(tab, val)
  for _,value in ipairs(tab) do
    if value == val then
      return true
    end
  end
end
