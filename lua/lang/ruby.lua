local nvim_lsp = require('lspconfig')

-- Ruby LSP (solargraph)
local solargraph_settings = {
  cmd = { "solargraph", "stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "ruby" },
  init_options = {
    formatting = true,
  },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      commandPath = HOME..'/.asdf/shims/solargraph',
      diagnostics = true,
    },
  },
}
nvim_lsp.solargraph.setup(solargraph_settings)
