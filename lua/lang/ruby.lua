-- Ruby LSP (solargraph)
local solargraph_settings = {
  cmd = { "solargraph", "stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "ruby" },
  init_options = {
    formatting = true,
  },
  root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git", ".exercism"),
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
      max_files = 0,
    },
  },
}

require('lspconfig').solargraph.setup(solargraph_settings)
