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
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  -- use 'tpope/vim-endwise'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-projectionist'

  -- Color schemes
  -- Lush is required by gruvbox.nvim
  use 'rktjmp/lush.nvim'
  use 'npxbr/gruvbox.nvim'
  use 'szw/vim-maximizer'

  use 'sangdol/mintabline.vim'

  -- DAP Setup
  -- use 'Pocco81/DAPInstall.nvim'
  -- use 'mfussenegger/nvim-dap'
  use 'puremourning/vimspector'

  use 'lewis6991/gitsigns.nvim'

  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'folke/lsp-colors.nvim'
  use 'folke/trouble.nvim'
  use 'folke/twilight.nvim'

  use 'vim-test/vim-test'

  use 'tpope/vim-unimpaired'

  -- use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use {
    'simrat39/rust-tools.nvim',
    commit = 'e29fb47326093fb197f17eae5ac689979a9ce191'
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
  use 'jpalardy/vim-slime'

  use { 'tzachar/cmp-tabnine', run = './install.sh' }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'mechatroner/rainbow_csv'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'  };

  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'David-Kunz/treesitter-unit'
  use 'p00f/nvim-ts-rainbow'
  use 'RRethy/nvim-treesitter-endwise'

  use 'windwp/nvim-autopairs'
  use 'kosayoda/nvim-lightbulb'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'

  -- Requires plenary and nui.nvim
  use 'bennypowers/nvim-regexplainer'

  use 'aklt/plantuml-syntax'
  use 'scrooloose/vim-slumlord'

  use 'simrat39/symbols-outline.nvim' -- Shows symbol outline of current file

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
