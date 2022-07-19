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
      autoformat = true,
      commandPath = HOME..'/.asdf/shims/solargraph',
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
    },
  },
}
nvim_lsp.solargraph.setup(solargraph_settings)
