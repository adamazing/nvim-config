local nvim_lsp = require('lspconfig')

nvim_lsp.marksman.setup{
  on_attach = on_attach
}
