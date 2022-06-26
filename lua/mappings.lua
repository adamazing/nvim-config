nmap("<C-h>", "<C-w>h");
nmap("<C-j>", "<C-w>j");
nmap("<C-k>", "<C-w>k");
nmap("<C-l>", "<C-w>l");

-- yank visual selection to tmux clipboard
vmap("<Leader>tc", "y<cr>:call system('tmux load-buffer -', @0)<cr>")

-- paste from tmux clipboard
nmap("<leader>tp", ':let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;')

nmap("<Leader>t", ":NvimTreeToggle<CR>");
nmap("<C-bslash>", ":NvimTreeFindFile<CR>");

--  Puts the absolute path to the current file into the system clipboard
nmap("<Leader>fp", ":let @+=expand('%:p')<CR>")
nmap("<Leader>fn", ":let @+=expand('%').':'.line('.')<CR>")

vmap("<C-c><C-c>", ":'<,'>SlimeSend<CR>")
nmap("<C-c><C-f>", ":SlimeSend0 expand('%')<CR>") -- send the relative file path to the pane configured with vim slime
nmap("<C-c><C-r>", ":SlimeSend0 'rspec '.expand('%')<CR>") -- send the relative file path to the pane configured with vim slime prefixed with 'rspec'
nmap("<C-c><C-n>", ":SlimeSend0 'rspec '.expand('%').':'.line('.')<CR>") -- send the path and line number with vim slime prefixed with 'rspec'

-- Escape mappings
-- imap(";;","<Esc>")
-- vmap(";;","<Esc>")
imap("jk","<Esc>")
vmap("jk","<Esc>")
-- imap("<Leader>;",";")

-- vim-test mappings
nmap("<Leader>rT", ":TestFile<CR>")
nmap("<Leader>rt", ":TestNearest<CR>")
nmap("<Leader>rl", ":TestLast<CR>")
nmap("<Leader>ra", ":TestSuite<CR>")
nmap("<Leader>rV", ":TestVisit<CR>")

-- Maximizer (zoom pane)
nmap("<Leader>z", ":MaximizerToggle<CR>")
vmap("<Leader>z", ":MaximizerToggle<CR>gv")
imap("<Leader>z", "<C-o>:MaximizerToggle<CR>")

nmap("<Leader>]", ":vertical resize +5<CR>")
nmap("<Leader>[", ":vertical resize -5<CR>")
nmap("<Leader>=", ":resize +5<CR>")
nmap("<Leader>-", ":resize -5<CR>")

-- Toggle background between dark and light
nmap("<Leader>bg", ":let &background = ( &background == 'dark'? 'light' : 'dark' )<CR>")

nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

imap ("<Leader>fe", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>");
nmap ("<Leader>fb", "<cmd>Telescope buffers<cr>");
nmap ("<Leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
nmap ("<Leader>fg", "<cmd>Telescope live_grep<cr>");
nmap ("<Leader>fh", "<cmd>Telescope help_tags<cr>");
nmap ("<Leader>fp", "<cmd>lua require'telescope.builtin'.builtin()<cr>");
nmap ("<Leader>fq", "<cmd>lua require'telescope.builtin'.quickfix()<cr>");
nmap ("<Leader>fs", "<cmd>Telescope grep_string<cr>");
nmap ("<Leader>ft", "<cmd>lua require'telescope.builtin'.treesitter()<cr>");
-- Search file changes (according to git)
nmap ("<Leader>fc", "<cmd>lua require'telescope.builtin'.git_status{}<cr>");

nmap("<Leader>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><Leader>l")


-- Trouble Keymappings
nmap("<Leader>xx", "<cmd>TroubleToggle<cr>")
nmap("<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nmap("<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nmap("<Leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nmap("<Leader>xl", "<cmd>TroubleToggle loclist<cr>")
nmap("gr", "<cmd>TroubleToggle lsp_references<cr>")

-- get a list of definitions or jump to a sole definition
nmap("gd", ":lua require'telescope.builtin'.lsp_definitions{}<cr>")
-- get a list of implementations for word under cursor or jump to sole implementation
nmap("gi", ":lua require'telescope.builtin'.lsp_implementations{}<cr>")

-- nmap("K", ":lua vim.lsp.buf.hover()<cr>")
-- nmap("<Leader>ca", ":lua vim.lsp.buf.code_action()<cr>")
-- nmap("<Leader>rn", ":lua vim.lsp.buf.rename()<cr>")

-- Treesitter playground query bindings
nmap("<Leader>tpg", ":TSPlaygroundToggle<CR>")
nmap("<Leader>ts", ":TSHighlightCapturesUnderCursor<CR>")

-- Debug Bindings
nmap("<Leader>dd", ":call vimspector#Launch()<CR>")
nmap("<Leader>dr", ":VimspectorReset<CR>")
nmap("<Leader>de", ":VimspectorEval")
nmap("<Leader>dw", ":VimspectorWatch")
nmap("<Leader>do", ":VimspectorShowOutput")
nmap("<Leader>di", "<Plug>VimspectorBalloonEval")
xmap("<Leader>di", "<Plug>VimspectorBalloonEval")


