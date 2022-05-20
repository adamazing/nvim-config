local nvim_lsp = require('lspconfig')

-- Lua LSP
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local luadev = {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.3',
        -- command = '~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("",true),
      },
      telemetry =  {
        enable = false,
      },
    }
  }
}
nvim_lsp.sumneko_lua.setup(luadev)
