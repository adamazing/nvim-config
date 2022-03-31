
"---- vim-plug setup  ----
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----

lua << EOF
  function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
  end

  function nmap(shortcut, command)
    map('n', shortcut, command)
  end

  function imap(shortcut, command)
    map('i', shortcut, command)
  end

  function vmap(shortcut, command)
    map('v', shortcut, command)
  end

  function xmap(shortcut, command)
    map('x', shortcut, command)
  end


  nmap("<C-h>", "<C-w>h");
  nmap("<C-j>", "<C-w>j");
  nmap("<C-k>", "<C-w>k");
  nmap("<C-l>", "<C-w>l");

  vim.cmd([[
    set guifont=CaskaydiaCove\ Nerd\ Font\ Mono
  ]]);

  vim.opt.foldtext = 'v:lua.custom_fold_text()'
  vim.opt.signcolumn = "yes";
  vim.opt.tabstop = 2;
  vim.opt.softtabstop = 0;
  vim.opt.shiftwidth = 2;
  vim.opt.mouse = "nv";
  vim.opt.expandtab = true;
  vim.opt.inccommand="split"
  vim.opt.foldcolumn = "1";
  vim.opt.formatoptions = "tcroqnj"
  vim.opt.shortmess = vim.opt.shortmess + "c"
  vim.opt.completeopt = {"menu", "menuone", "preview", "noinsert", "noselect"}
  vim.opt.ignorecase = true;
  vim.opt.showmode = false;
  vim.opt.swapfile = false;
  vim.opt.wrap = false;
  vim.opt.number = true;
  vim.opt.relativenumber = true;
  vim.opt.smartindent = true;
  vim.opt.cmdheight = 2;
  vim.opt.colorcolumn = {150};
  vim.opt.updatetime=50;
  vim.opt.virtualedit = {"block"};
EOF

call plug#begin('~/.config/nvim/plugged')
" Specify Plugins
" Sensible default
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'

" Color schemes
Plug 'rktjmp/lush.nvim' " Required by gruvbox.nvim
Plug 'npxbr/gruvbox.nvim'
Plug 'szw/vim-maximizer'

Plug 'sangdol/mintabline.vim'

" DAP Setup
" Plug 'Pocco81/DAPInstall.nvim'
" Plug 'mfussenegger/nvim-dap'
Plug 'puremourning/vimspector'

Plug 'airblade/vim-gitgutter'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/twilight.nvim'

Plug 'vim-test/vim-test'

Plug 'tpope/vim-unimpaired'

" Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Plug 'simrat39/rust-tools.nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'mechatroner/rainbow_csv'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'David-Kunz/treesitter-unit'
Plug 'p00f/nvim-ts-rainbow'
Plug 'RRethy/nvim-treesitter-endwise'

" Requires plenary and nui.nvim
Plug 'bennypowers/nvim-regexplainer'

Plug 'windwp/nvim-autopairs'
Plug 'kosayoda/nvim-lightbulb'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'

Plug 'simrat39/symbols-outline.nvim' " Shows symbol outline of current file

call plug#end()


lua << EOF
  vim.cmd([[
    highlight ColorColumn ctermbg=grey guibg=grey
    highlight OverLength ctermbg=red guibg=red
  ]])

  function _G.MatchOverLength()
    vim.cmd('match OverLength /\\%151v.\\+/')
  end

  local overlength_augroup = vim.api.nvim_create_augroup("overlength_cmds", { clear = true})
  vim.api.nvim_create_autocmd( {"BufEnter", "InsertLeave"}, { callback = MatchOverLength, group = overlength_augroup})

  function contains(tab, val)
    for i,value in ipairs(tab) do
      if value == val then
        return true
      end
    end
  end

  function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    local line_text = "("..vim.v.foldstart.."-"..vim.v.foldend..")"

    return "     "..line_count.." lines "..line_text.." -[ "..line
  end

  function _G.over_length()
    local ignore_filetypes_over_length = { "csv" }
    if contains(ignore_filetypes_over_length, vim.bo.filetype) == true then
      print("Filetype: "..vim.bo.filetype)
    end
  end
  --  vim.api.highlight

  if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
  end

  vim.g.gruvbox_contrast_light = 'hard'
  vim.g.gruvbox_contrast_dark = 'soft'
  vim.cmd('colorscheme gruvbox')

  -- Add mappings for tab line e.g. use `2,` to jump to the second tab
  for i=1,9 do
    nmap(i..",", i.."gt")
  end

EOF

" TODO Move the following to the nvim tree lua setup
" let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
" let g:nvim_tree_lsp_diagnostics = 1
" let g:nvim_tree_width_allow_resize  = 1
" let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`

let g:vimspector_enable_mappings = 'HUMAN'

" vim-test settings
let test#strategy = "dispatch"

lua << EOF
  function _G.TrimWhitespace()
    local patterns = { [[%s/\s\+$//e]], }
    local save = vim.fn.winsaveview()
    for _, p in pairs(patterns) do
      vim.api.nvim_exec(string.format("keeppatterns silent! %s", p), false)
    end
    vim.fn.winrestview(save)
  end

  -- pre save action
  local pre_save_augroup = vim.api.nvim_create_augroup( "presave_cmds", { clear = true} )
  vim.api.nvim_create_autocmd( {"BufWritePre"}, { callback = TrimWhitespace, group = pre_save_augroup})

  function _G.highlight_on_yank()
    require'vim.highlight'.on_yank()
  end

  local hightlight_yank_group = vim.api.nvim_create_augroup( "highlight_yank", { clear = true } )
  vim.api.nvim_create_autocmd( {"TextYankPost"}, { group = hightlight_yank_group, callback = highlight_on_yank})

  -- Used in an interactive rebase, squash all commits into the earliest one then write and exit
  function fix_rebase()
    vim.cmd([[
      :2,$s/^pick /f /
      :wq
    ]])
  end

  vim.cmd([[
    cabbrev ff <cmd>lua fix_rebase()<CR>
  ]])
EOF

" yank visual selection to tmux clipboard
vnoremap <leader>tc y<cr>:call system("tmux load-buffer -", @0)<cr>
" paste from tmux clipboard
nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;

lua << EOF
  nmap("<Leader>t", ":NvimTreeToggle<CR>");
  nmap("<C-bslash>", ":NvimTreeFindFile<CR>");

  --  Puts the absolute path to the current file into the system clipboard
  nmap("<Leader>fp", ":let @+=expand('%:p')<CR>")
  nmap("<Leader>fn", ":let @+=expand('%').':'.line('.')<CR>")

  vim.g.rainbow_active = 1;
  vim.g.ruby_host_prog = 'asdf exec neovim-ruby-host'

  -- Escape mappings
  imap(";;","<Esc>")
  vmap(";;","<Esc>")
  imap("jk","<Esc>")
  vmap("jk","<Esc>")
  imap("<Leader>;",";")

  -- vim-test mappings
  nmap("<Leader>rT", ":TestFile<CR>")
  nmap("<Leader>rt", ":TestNearest<CR>")
  nmap("<Leader>rl", ":TestLast<CR>")
  nmap("<Leader>ra", ":TestSuite<CR>")
  nmap("<Leader>rV", ":TestVisit<CR>")

  -- Maximizer (zoom pane)
  nmap("<Leader>z", ":MaximizerToggle<CR>")
  vmap("<Leader>z", ":MaximizerToggle<CR>gv")
  imap("<Leader>z", "<C-o>:MaximizerToggle<CR>")

  nmap("<Leader>]", ":vertical resize +5<CR>")
  nmap("<Leader>[", ":vertical resize -5<CR>")
  nmap("<Leader>=", ":resize +5<CR>")
  nmap("<Leader>-", ":resize -5<CR>")

  -- Toggle background between dark and light
  nmap("<Leader>bg", ":let &background = ( &background == 'dark'? 'light' : 'dark' )<CR>")

  nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

  nmap ("<Leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
  nmap ("<Leader>fg", "<cmd>Telescope live_grep<cr>");
  nmap ("<Leader>fb", "<cmd>Telescope buffers<cr>");
  nmap ("<Leader>fh", "<cmd>Telescope help_tags<cr>");
  -- Search file changes (according to git)
  nmap ("<Leader>fc", "<cmd>lua require'telescope.builtin'.git_status{}<cr>");
  nmap ("<Leader>fs", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>");
  imap ("<Leader>fs", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>");

  nmap("<Leader>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><Leader>l")


  -- Trouble Keymappings
  nmap("<Leader>xx", "<cmd>TroubleToggle<cr>")
  nmap("<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
  nmap("<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
  nmap("<Leader>xq", "<cmd>TroubleToggle quickfix<cr>")
  nmap("<Leader>xl", "<cmd>TroubleToggle loclist<cr>")
  nmap("gr", "<cmd>TroubleToggle lsp_references<cr>")

  -- get a list of definitions or jump to a sole definition
  nmap("gd", ":lua require'telescope.builtin'.lsp_definitions{}<cr>")
  -- get a list of implementations for word under cursor or jump to sole implementation
  nmap("gi", ":lua require'telescope.builtin'.lsp_implementations{}<cr>")
  nmap("K", ":lua vim.lsp.buf.hover()<cr>")
  nmap("<Leader>ca", ":lua vim.lsp.buf.code_action()<cr>")

  -- Treesitter playground query bindings
  nmap("<Leader>tpg", ":TSPlaygroundToggle<CR>")
  nmap("<Leader>ts", ":TSHighlightCapturesUnderCursor<CR>")

  -- Debug Bindings
  nmap("<Leader>dd", ":call vimspector#Launch()<CR>")
  nmap("<Leader>dr", ":VimspectorReset<CR>")
  nmap("<Leader>de", ":VimspectorEval")
  nmap("<Leader>dw", ":VimspectorWatch")
  nmap("<Leader>do", ":VimspectorShowOutput")
  nmap("<Leader>di", "<Plug>VimspectorBalloonEval")
  xmap("<Leader>di", "<Plug>VimspectorBalloonEval")

  vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug1'}


  ----------------------------------------------------------------------------------------------


  require'nvim-tree'.setup {
    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },
    view = {
      lsp_diagnostics = true,
    }
  }

  -- not shown: defaults
  require'regexplainer'.setup {
    -- automatically show the explainer when the cursor enters a regexp
    auto = true,
    popup = {
      border = {
        padding = { 1, 2},
        style="rounded"
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
    -- debug = true,
  }

--  require('auto-session').setup {
--    log_level = 'info',
--    auto_session_suppress_dirs = {'~/', '~/Projects'}
--  }
--
  require("completion")
  require("treesitter")
  require("lang")
  require("statusbar")
  require("telescope_integration")
  require("prettiness")
  -- require("keymaps")
EOF

" lua <<EOF
"   require("rust-tools").setup({})
" EOF
