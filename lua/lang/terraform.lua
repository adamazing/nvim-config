local nvim_lsp = require('lspconfig')

nvim_lsp.terraformls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
