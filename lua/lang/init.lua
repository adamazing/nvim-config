USER = vim.fn.expand('$USER')
HOME = vim.fn.expand('$HOME')

require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}

local handlers = {
  function (server_name)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["solargraph"] = function ()
    require'lang/ruby'
  end,
  ["gopls"] = function ()
    require("lspconfig")['gopls'].setup {
      cmd = { "gopls", "serve" },
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["biome"] = function ()
    require("lspconfig")['biome'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = require("lspconfig").util.root_pattern('biome.json', 'package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
    }
  end,
  ["fsautocomplete"] = function ()
    require("lspconfig")['fsautocomplete'].setup {
      cmd = { 'dotnet', 'run', 'fsautocomplete', '--adaptive-lsp-server-enabled', '--verbose' },
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = require("lspconfig").util.root_pattern('.git', '*.fsproj'),
    }
  end,
  ["ballerina"] = function ()
    require("lspconfig")['ballerina'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["yamlls"] = function ()
    require("lspconfig")['yamlls'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require'schemastore'.yaml.schemas(),
      }
    }
  end,
  ["jsonls"] = function ()
    require("lspconfig")['jsonls'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require'schemastore'.json.schemas(),
          validate = { enable = true },
        },
      }
    }
  end
}

require("mason-lspconfig").setup {
  ensure_installed = {
    "biome",
    "fsautocomplete",
    "gopls",
    "hls",
    "marksman",
    "nimls",
    "r_language_server",
    "rust_analyzer",
    "solargraph",
    "sqlls",
  },
  automatic_installation = true,
  automatic_server_setup = true,
  handlers = handlers,
}

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

-- override borders
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "double"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

_G.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Customizing how diagnostics are displayed
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Change diagnostic symbols in the sign column (gutter) 
local signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
