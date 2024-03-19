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

nmap("<Leader>l2", ":set laststatus=2<CR>")
nmap("<Leader>l3", ":set laststatus=3<CR>")

nmap('[d', ":lua vim.diagnostic.goto_prev()<CR>")
nmap(']d', ":lua vim.diagnostic.goto_next()<CR>")

-- leader followed by nothing clears search highlights
nmap("<Leader>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><Leader>l")

keymap("n", "i", function()
  if #vim.fn.getline "." == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })

-- LSP mappings
_G.on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>ly', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting:)<CR>', opts)
  -- diagnostics
  buf_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- Format on save, Also solves: When save, LSP check works
  if client.server_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end -- Format
end

