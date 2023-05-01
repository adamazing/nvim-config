-- Mappings that don't relate to any particular plugin.
-- Plugins with their own configuration file have mappings there.
-- Plugins with simpler setups have mappings in plugins.lua
nmap("<C-h>", "<C-w>h");
nmap("<C-j>", "<C-w>j");
nmap("<C-k>", "<C-w>k");
nmap("<C-l>", "<C-w>l");

-- yank visual selection to tmux clipboard
vmap("<Leader>tc", "y<cr>:call system('tmux load-buffer -', @0)<cr>")

-- paste from tmux clipboard
nmap("<leader>tp", ':let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;')

--  Puts the absolute path to the current file into the system clipboard
nmap("<Leader>fp", ":let @+=expand('%:p')<CR>")
nmap("<Leader>fn", ":let @+=expand('%').':'.line('.')<CR>")

-- Escape mappings
-- imap(";;","<Esc>")
-- vmap(";;","<Esc>")
imap("jk","<Esc>")
vmap("jk","<Esc>")
-- imap("<Leader>;",";")

nmap("<Leader>]", ":vertical resize +5<CR>")
nmap("<Leader>[", ":vertical resize -5<CR>")
nmap("<Leader>=", ":resize +5<CR>")
nmap("<Leader>-", ":resize -5<CR>")

nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- leader followed by nothing clears search highlights
nmap("<Leader>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><Leader>l")
