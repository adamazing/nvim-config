---@diagnostic disable: undefined-global
--
--
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--
-- parser_config.liquid = {
--   install_info = {
--     url = "~/Documents/MProjects/tree-sitter-liquid",
--     files = {"src/parser.c"},
--     branch = "main",
--     generate_requires_npm = false,
--     requires_generate_from_grammar = true,
--   },
--   filetype = "liquid",
-- }

require'nvim-treesitter.configs'.setup {
  -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
  -- ensure_installed = {"python", "bash", "javascript", "clojure", "go"},
  ensure_installed = 'all',
  ignore_install = { 'phpdoc', 'php' },

  -- endwise= {
  --   enable = true, -- endwise completion with TS for ruby
  -- },
  --
  highlight = { -- enable highlighting for all file types
    enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
    disable = { "embedded_template", "csv" }
  },
  --
  -- incremental_selection = {
  --   enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
  --   -- disable = { "cpp", "lua" },
  --   keymaps = {                       -- mappings for incremental selection (visual mappings)
  --     init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
  --     node_incremental = 'grn',       -- increment to the upper named parent
  --     scope_incremental = 'grc',      -- increment to the upper scope (as defined in locals.scm)
  --     node_decremental = 'grm',       -- decrement to the previous node
  --   }
  -- },
  --
  -- rainbow = {
  --   enable = true,
  --   query = {
  --     'rainbow-parens',
  --     go = 'rainbow-parens',
  --     css = 'rainbow-parens',
  --     html = 'rainbow-tags',
  --     javascript = 'rainbow-parens-react',
  --     eruby = 'rainbow-tags',
  --     lua = 'rainbow-parens',
  --     rust = 'rainbow-parens',
  --     typescript = 'rainbow-parens',
  --     yaml = 'rainbow-parens',
  --   },
  -- },
  --
  -- playground = {
  --   enable = true,
  --   disable = {},
  --   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
  --   persist_queries = false, -- Whether the query persists across vim sessions
  --   keybindings = {
  --     toggle_query_editor = 'o',
  --     toggle_hl_groups = 'i',
  --     toggle_injected_languages = 't',
  --     toggle_anonymous_nodes = 'a',
  --     toggle_language_display = 'I',
  --     focus_language = 'f',
  --     unfocus_language = 'F',
  --     update = 'R',
  --     goto_node = '<cr>',
  --     show_help = '?',
  --   },
  -- },
  --
  -- query_linter = {
  --   enable = true,
  --   use_virtual_text = true,
  --   lint_events = {"BufWrite", "CursorHold"},
  -- },
  --
  -- textobjects = {
  --   lsp_interop = {
  --     enable = true,
  --     border = 'none',
  --     peek_definition_code = {
  --       ["<leader>pf"] = "@function.outer",
  --       ["<leader>pc"] = "@class.outer"
  --     }
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ["<leader>cn"] = "@parameter.inner",
  --     },
  --     swap_previous = {
  --       ["<leader>cp"] = "@parameter.outer",
  --     },
  --   },
  --   -- These are provided by
  --   select = {
  --     enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
  --     keymaps = {
  --       -- You can use the capture groups defined here:
  --       -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ab"] = "@block.outer",
  --       ["ib"] = "@block.inner",
  --       ["as"] = "@statement.outer",
  --       ["is"] = "@statement.inner",
  --     },
  --   },
  -- },
  -- textsubjects = {
  --   enable = true,
  --   keymaps = {
  --   }
  -- }
}

nmap("<Leader>tpg", ":TSPlaygroundToggle<CR>")
nmap("<Leader>ts", ":TSHighlightCapturesUnderCursor<CR>")

-- vmap('x', ':lua require"treesitter-unit".select()<CR>')
-- omap('x', ':<c-u>lua require"treesitter-unit".select()<CR>')
