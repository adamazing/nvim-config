require("helpers")

-- Toggle presentationMode
nmap("]p", function() togglePresentationMode() end)

vim.g['presentationMode'] = false
vim.g['presentationMode_CursorLineVal'] = vim.opt.cursorline
vim.g['presentationMode_CmdHeightVal'] = vim.opt.cmdheight
-- vim.g['presentationMode_GuiCursorVal'] = vim.opt.guicursor
vim.g['presentationMode_FoldColumnVal'] = vim.opt.foldcolumn
vim.g['presentationMode_AlacrittyFontSize'] = 16 -- Hardcoded for now

vim.g['presentationMode_FoldColumnHighlightVal'] = vim.api.nvim_get_hl(0, {name = 'FoldColumn'})

function _G.togglePresentationMode()
  if vim.g['presentationMode'] == false then
    enterPresentationMode()
  else
    exitPresentationMode()
  end
end

function _G.enterPresentationMode()
  local o = vim.opt
  nmap('<Left>', function()
    vim.cmd('bprev')
  end)
  nmap('<Right>', function()
    vim.cmd('bnext')
  end)

  local buf_enter_pres_group = vim.api.nvim_create_augroup( "buf_enter_pres_cmds", { clear = true } )
  vim.api.nvim_create_autocmd( {"BufEnter", "BufWinEnter"}, { group = buf_enter_pres_group, callback = function()
    UpdateAlacrittyFontSize(vim.g['presentationMode_AlacrittyFontSize'])  -- entering a new slide, reset font size
    if vim.api.nvim_buf_get_option(0, "filetype") == "markdown" then
      FindAndExecuteFontCommand()                                         -- if there's a font size note, execute it
    end
  end})

  o.cmdheight = 0
  o.cursorline = false
  o.foldcolumn = "5"
  o.foldtext = 'v:lua.PresentationModeFoldText()'
  vim.api.nvim_set_hl(0, 'FoldColumn', {bg="None", fg="None"})

  -- o.guicursor = "a:blinkon0"
  o.number = false
  o.relativenumber = false
  o.signcolumn = "no"

  -- Disable lualine
  ---@diagnostic disable-next-line: undefined-field
  require('lualine').hide()

  -- Toggle tmux status bar
  vim.fn.system("tmux set status off")
  vim.g['presentationMode'] = true
end

function _G.exitPresentationMode()
  local o = vim.opt
  maprm({'n'}, '<Left>')
  maprm({'n'}, '<Right>')

  o.cmdheight = 0
  o.cursorline = true
  o.foldcolumn = vim.g['presentationMode_FoldColumnVal']
  o.number = true
  o.relativenumber = true
  o.signcolumn = "yes"
  -- o.guicursor = vim.g['presentationMode_GuiCursorVal']
  o.foldtext = 'v:lua.custom_fold_text()'

  -- vim.api.nvim_set_hl(0, 'FoldColumn', vim.g['presentationMode_FoldColumnHighlightVal'])

  -- Re-enable lualine
  ---@diagnostic disable-next-line: undefined-field
  require('lualine').hide({unhide=true})

  -- Remove augroup for buf_enter_pres_cmds
  vim.api.nvim_del_augroup_by_name("buf_enter_pres_cmds")

  -- Reset alacritty font size
  UpdateAlacrittyFontSize(vim.g['presentationMode_AlacrittyFontSize'])

  -- Toggle tmux status bar
  vim.fn.system("tmux set status on")
  vim.g['presentationMode'] = false
end

function _G.UpdateAlacrittyFontSize(fontSize)
  vim.fn.system({'sed', '-E', '-i', '.bak',
                 '-e', 's/(size: )[0-9]{2}[.0-9]*/\\1'..fontSize ..'.0/',
                '/Users/adam/.config/alacritty/alacritty.yml' })
end

function _G.FindAndExecuteFontCommand()
  local line = vim.fn.search('^!!Presentation:Font:', 'n')
  local matches = vim.fn.matchlist(vim.fn.getline(line), 'Font:\\s*\\(.*\\)$')
  if #matches == 0 then
    -- vim.print("No font command found")
    return
  end
  -- vim.print(matches)
  local fontSize = matches[2]
  -- vim.print(command)
  UpdateAlacrittyFontSize(fontSize)
end

function _G.PresentationModeFoldText()
  return ""
end
