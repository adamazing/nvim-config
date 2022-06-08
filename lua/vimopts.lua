---@diagnostic disable: undefined-global

vim.opt.cmdheight = 2;
vim.opt.colorcolumn = {150};
vim.opt.completeopt = {"menu", "menuone", "preview", "noinsert", "noselect"}
vim.opt.cursorline = true;
vim.opt.cursorlineopt = { "number", "screenline" }
vim.opt.expandtab = true;
vim.opt.fillchars:append('eob: ');
vim.opt.foldcolumn = "1";
vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.formatoptions = "tcroqnj"
vim.opt.guifont = 'CaskaydiaCove Nerd Font Mono'
vim.opt.ignorecase = true;
vim.opt.inccommand="split"
vim.opt.mouse = "nv";
vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.shiftwidth = 2;
vim.opt.shortmess:append('c');
vim.opt.showmode = false;
vim.opt.signcolumn = "yes";
vim.opt.smartindent = true;
vim.opt.softtabstop = 0;
vim.opt.swapfile = false;
vim.opt.tabstop = 2;

if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

vim.opt.updatetime=50;
vim.opt.virtualedit = {"block"};
vim.opt.wrap = false;
