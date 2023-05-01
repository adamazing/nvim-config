local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup{
  on_attach = on_attach
}
