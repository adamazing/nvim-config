local rust_tools_opts = {
  tools = {
    on_initialized = function(result)
      print("Rust tools loaded..")
    end,
    inlay_hints = {
      show_variable_name = true,
    },
  },
  hover_actions = {
    -- the border that is used for the hover window
    -- see vim.api.nvim_open_win()
    border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    },
  }
}

require('rust-tools').setup(rust_tools_opts)

local nvim_lsp = require'lspconfig'
local rust_opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.rust_analyzer.setup(rust_opts)
