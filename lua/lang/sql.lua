local nvim_lsp = require('lspconfig')

nvim_lsp.sqlls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
