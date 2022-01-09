---@diagnostic disable: undefined-global
require'nvim-treesitter.configs'.setup {
  -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
  -- ensure_installed = {"python", "bash", "javascript", "clojure", "go"},
  ensure_installed = "all",
  ignore_install = { "haskell" },

  context_commentstring = {
    enable = true
  },

  highlight = { -- enable highlighting for all file types
    enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
  },

  incremental_selection = {
    enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
    -- disable = { "cpp", "lua" },
    keymaps = {                       -- mappings for incremental selection (visual mappings)
      init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
      node_incremental = "grn",       -- increment to the upper named parent
      scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
      node_decremental = "grm",       -- decrement to the previous node
    }
  },

  rainbow = {
    enable = true,
    extended_mode = true, --Highlights other non-parentheses delimiters
    max_file_lines = 1000,
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },

  textobjects = {
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>pf"] = "@function.outer",
        ["<leader>pc"] = "@class.outer"
      }
    },

    -- These are provided by
    select = {
      enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
      keymaps = {
        -- You can use the capture groups defined here:
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",
      },
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
    }
  }
}

vim.api.nvim_set_keymap('v', 'x', ':lua require"treesitter-unit".select()<CR>', {noremap=true})
vim.api.nvim_set_keymap('o', 'x', ':<c-u>lua require"treesitter-unit".select()<CR>', {noremap=true})
