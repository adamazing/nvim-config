---@diagnostic disable: undefined-field
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-sensible'

  use 'tpope/vim-speeddating'
  use 'tpope/vim-abolish'
  use 'tpope/vim-rails'
  -- use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  -- use 'tpope/vim-endwise'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-projectionist'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function()
      require('nvim-surround').setup()
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.list = true
      require('indent_blankline').setup({
        space_char_blankline = ' ',
        show_current_context = true,
        show_current_context_start = true,
      })
    end
  }

  use {
    "adamazing/markdown-preview.nvim",
    branch = 'main',
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }

  -- Color schemes
  use { 'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup({
        contrast = "",
        overrides = {
        },
      })
      vim.cmd([[colorscheme gruvbox]])
    end
  }

  use { 'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          gitsigns = true,
          mason = true,
          nvimtree = true,
          treesitter = true,
          ts_rainbow2 = true
        }
      })
      -- vim.cmd([[colorscheme catppuccin]])
    end
  }

  use { 'szw/vim-maximizer',
    config = function()
      -- Maximizer (zoom pane)
      nmap("<Leader>z", ":MaximizerToggle<CR>")
      vmap("<Leader>z", ":MaximizerToggle<CR>gv")
      imap("<Leader>z", "<C-o>:MaximizerToggle<CR>")
    end
  }

  use { 'sangdol/mintabline.vim',
    config = function()
      -- E.g. use `2,` in normal mode to jump to the second tab
      for i=1,9 do
        nmap(i..",", i.."gt")
      end
    end
  }

  -- DAP Setup
  -- use 'Pocco81/DAPInstall.nvim'
  -- use 'mfussenegger/nvim-dap'
  use { 'puremourning/vimspector',
    config = function ()
      vim.g.vimspector_enable_mappings = 'HUMAN'
      vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug1'}

      -- Debug Bindings
      nmap("<Leader>dd", ":call vimspector#Launch()<CR>")
      nmap("<Leader>dr", ":VimspectorReset<CR>")
      nmap("<Leader>de", ":VimspectorEval")
      nmap("<Leader>dw", ":VimspectorWatch")
      nmap("<Leader>do", ":VimspectorShowOutput")
      nmap("<Leader>di", "<Plug>VimspectorBalloonEval")
      xmap("<Leader>di", "<Plug>VimspectorBalloonEval")
    end
  }

  use 'lewis6991/gitsigns.nvim'

  use { 'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-web-devicons',
    }
  }

  use { 'nvim-tree/nvim-web-devicons',
    config = function ()
      require('nvim-web-devicons').setup {
        -- your personal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh"
          }
        };
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
      }
    end
  }

  use { 'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require'nvim-tree'.setup {
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        diagnostics = {
          enable = true,
        },
        renderer = {
          special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
        }
      }
      nmap("<Leader>t", ":NvimTreeToggle<CR>");
      nmap("<C-bslash>", ":NvimTreeFindFile<CR>");
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function ()
      require("trouble").setup{
        auto_close = true,
        signs = {
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠"
        },
        use_diagnostics = false,
      }
      -- Trouble Keymappings
      nmap("<Leader>xx", "<cmd>TroubleToggle<cr>")
      nmap("<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
      nmap("<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
      nmap("<Leader>xq", "<cmd>TroubleToggle quickfix<cr>")
      nmap("<Leader>xl", "<cmd>TroubleToggle loclist<cr>")
      nmap("gr", "<cmd>TroubleToggle lsp_references<cr>")
    end
  }

  use { 'folke/twilight.nvim',
    config = function ()
      require("twilight").setup {
        dimming = {
          alpha = 0.15, -- amount of dimming
          -- color = { "Normal", "#111111" }
        },
      }

      nmap('<Leader>tw',':Twilight<CR>')
    end
  }

  use {'vim-test/vim-test',
    config = function()
      -- vim-test mappings
      nmap("<Leader>rT", ":TestFile<CR>")
      nmap("<Leader>rt", ":TestNearest<CR>")
      nmap("<Leader>rl", ":TestLast<CR>")
      nmap("<Leader>ra", ":TestSuite<CR>")
      nmap("<Leader>rV", ":TestVisit<CR>")
    end
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'neovim/nvim-lspconfig',
  }

  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    requires = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      vim.diagnostic.config({ virtual_text = false })
      require("lsp_lines").setup()
    end
  }

  use {
    'napmn/react-extract.nvim',
    ft={'typescript', 'javascript'},
    config = function()
      require("react-extract").setup()
    end
  }

  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        ignore_beginning = true,
        completion = true,
        tabouts ={
          {open = "'", close = "'"},
          {open = '"', close = '"'},
          {open = '`', close = '`'},
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'},
          {open = '#', close = ']'}
        }
      }
    end
  }

  -- provides tmux repl functionality (sending code to REPL running in a tmux window/pane)
  use { 'jpalardy/vim-slime',
    config = function()
      vmap("<C-c><C-c>", ":'<,'>SlimeSend<CR>")
      nmap("<C-c><C-f>", ":SlimeSend0 expand('%')<CR>") -- send the relative file path to the pane configured with vim slime
      nmap("<C-c><C-r>", ":SlimeSend0 'rspec '.expand('%')<CR>") -- send the relative file path to the pane configured with vim slime prefixed with 'rspec'
      nmap("<C-c><C-n>", ":SlimeSend0 'rspec '.expand('%').':'.line('.')<CR>") -- send the path and line number with vim slime prefixed with 'rspec'

      -- vim-slime options
      vim.g.slime_target = "tmux"
      -- default target, override with `:SlimeConfig`
      vim.cmd( [[
        let g:slime_default_config = { "socket_name": "default", "target_pane": "{right}" }
      ]] )
    end
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh',
    requires = {
      'hrsh7th/nvim-cmp'
    }
  }
  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function ()
      require('copilot_cmp').setup()
    end
  }
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
     config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  }
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'mechatroner/rainbow_csv'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'  };

  use {'nvim-treesitter/playground',
    config = function()
    end,
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use { 'nvim-treesitter/nvim-treesitter-textobjects',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use { 'RRethy/nvim-treesitter-textsubjects',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use { 'JoosepAlviste/nvim-ts-context-commentstring',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use { 'David-Kunz/treesitter-unit',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use { 'RRethy/nvim-treesitter-endwise',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use { 'HiPhish/nvim-ts-rainbow2',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }

  -- use {'windwp/nvim-autopairs',
  --   config = function() require('nvim-autopairs').setup({ }) end
  -- }

  use { 'kosayoda/nvim-lightbulb',
    config = function ()
      -- show a light-bulb whenever a code action is available
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end
  }

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'

  use {'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'

  use {'bennypowers/nvim-regexplainer',
    config = function ()
      -- not shown: defaults
      require'regexplainer'.setup {
        -- automatically show the explainer when the cursor enters a regexp
        auto = true,
        filetypes = {
          'html',
          'js',
          'jsx',
          'python',
          'ruby',
          'rust',
        },
        popup = {
          border = {
            padding = { 1, 2},
            style="shadow"
          },
        },
        narrative = {
          separator = function(component)
            local sep = '\n ';
            if component.depth > 0 then
              for _ = 1, component.depth do
                sep = sep .. '> '
              end
            end
            return sep
          end
        },
      }
    end,
    requires = {
      'nvim-treesitter/nvim-treesitter',
      'MunifTanjim/nui.nvim',
    }
  }

  use 'aklt/plantuml-syntax'

  use 'simrat39/symbols-outline.nvim' -- Shows symbol outline of current file

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
