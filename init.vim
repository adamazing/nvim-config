
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

set shortmess += "c"

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

  nmap("<C-h>", "<C-w>h");
  nmap("<C-j>", "<C-w>j");
  nmap("<C-k>", "<C-w>k");
  nmap("<C-l>", "<C-w>l");

  vim.cmd([[
    set guifont=CaskaydiaCove\ Nerd\ Font\ Mono
    set fillchars=fold:\ | set foldtext=CustomFold()
  ]]);

  vim.opt.signcolumn = "yes";
  vim.opt.tabstop = 2;
  vim.opt.softtabstop = 0;
  vim.opt.shiftwidth = 2;
  vim.opt.mouse = "nv";
  vim.opt.expandtab = true;
  vim.opt.inccommand="split"
  vim.opt.foldcolumn = "1";
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

function! CustomFold()
  return printf('    %d lines -[ %s',v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

highlight ColorColumn ctermbg=grey guibg=grey
fun! PanicOverLength()
  " Don't show red bg on overlength for these file types
  if &ft =~ 'csv'
    return
  endif
  match OverLength /\%150v.*/
endfun

augroup vimrc_autocmds
    autocmd InsertLeave * highlight OverLength ctermbg=red guibg=red
    autocmd InsertLeave * call PanicOverLength()
augroup END

if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='soft'
colo gruvbox

for i in range(1,9)
  exec 'nnoremap ' .. i .. ', ' .. i .. 'gt'
endfor


" let g:nvim_tree_auto_open = 1
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

nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <C-bslash> :NvimTreeFindFile<CR>

" Puts the absolute path to the current file into the system clipboard
nnoremap <Leader>fp :let @+=expand('%:p')<CR>
nnoremap <Leader>fn :let @+=expand('%').":".line(".")<CR>

let g:rainbow_active=1

let g:ruby_host_prog='asdf exec neovim-ruby-host'

" function which trims trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppattern %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup AJH
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" :Fix searches and replaces all but the first instance of 'pick' to 'f' to squash previous commits into a fix commit
function! Fix()
  :2,$s/^pick /f /
  :wq
endfunction

" Abbreviate the Fix() call so it can be run with `ff`
cabbrev ff call Fix()

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" yank visual selection to tmux clipboard
vnoremap <leader>tc y<cr>:call system("tmux load-buffer -", @0)<cr>
" paste from tmux clipboard
nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;

lua << EOF

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

  nmap ("<leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
  nmap ("<leader>fg", "<cmd>Telescope live_grep<cr>");
  nmap ("<leader>fb", "<cmd>Telescope buffers<cr>");
  nmap ("<leader>fh", "<cmd>Telescope help_tags<cr>");
  -- Search file changes (according to git)
  nmap ("<leader>fc", "<cmd>lua require'telescope.builtin'.git_status{}<cr>");
  nmap ("<leader>fs", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>");
  imap ("<leader>fs", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>");
EOF

nnoremap <silent> <leader> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader>l

" Trouble Keymappings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <silent>gr <cmd>TroubleToggle lsp_references<cr>


" get a list of definitions or jump to a sole definition
nnoremap <silent>gd :lua require'telescope.builtin'.lsp_definitions{}<cr>
" get a list of implementations for word under cursor or jump to sole
" implementation
nnoremap <silent>gi :lua require'telescope.builtin'.lsp_implementations{}<cr>
nnoremap <silent>K :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<cr>


" Debug Bindings
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dr :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>di <Plug>VimspectorBalloonEval

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2']

" Treesitter playground query bindings
nnoremap <leader>tpg :TSPlaygroundToggle<CR>
nnoremap <leader>ts :TSHighlightCapturesUnderCursor<CR>


lua <<EOF
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
