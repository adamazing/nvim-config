nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

syntax enable

set icm=split
set cmdheight=2
set colorcolumn=150
set expandtab
set guifont=CaskaydiaCove\ Nerd\ Font\ Mono
set ignorecase
set mouse=nv
set noshowmode
set noswapfile
set nu
set rnu
set nowrap
set shortmess+=c
set signcolumn=yes
set smartindent
set tabstop=2 softtabstop=0 shiftwidth=2 smarttab
set updatetime=50
set virtualedit=block
set fillchars=fold:\ | set foldtext=CustomFold()
set foldcolumn=1
set completeopt=menu,menuone,noselect


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

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

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
Plug 'glepnir/lspsaga.nvim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'rmagatti/auto-session'

Plug 'mechatroner/rainbow_csv'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'David-Kunz/treesitter-unit'
Plug 'p00f/nvim-ts-rainbow'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


call plug#end()

function! CustomFold()
  return printf('    %d lines -[ %s',v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

highlight ColorColumn ctermbg=grey guibg=grey
augroup vimrc_autocmds
    autocmd InsertLeave * highlight OverLength ctermbg=red guibg=red
    autocmd InsertLeave * match OverLength /\%150v.*/
augroup END

if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='soft'
colo gruvbox

let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_cursor_antialiasing=v:true

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

" Puts the relative path to the current file into the system clipboard
nnoremap <Leader>fn :let @+=expand('%:t')<CR>

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

inoremap ;; <Esc>
vnoremap ;; <Esc>
inoremap jk <Esc>
vnoremap jk <Esc>
inoremap <Leader>; ;

" vim-test mappings
nnoremap <Leader>rT :TestFile<CR>
nnoremap <Leader>rt :TestNearest<CR>
nnoremap <Leader>rl :TestLast<CR>
nnoremap <Leader>ra :TestSuite<CR>
nnoremap <Leader>rV :TestVisit<CR>

" vim maximiser
nnoremap <silent><Leader>z :MaximizerToggle<CR>
vnoremap <silent><Leader>z :MaximizerToggle<CR>gv
inoremap <silent><Leader>z <C-o>:MaximizerToggle<CR>

nnoremap <leader>] :vertical resize +5<CR>
nnoremap <leader>[ :vertical resize -5<CR>
nnoremap <leader>= :res +5<CR>
nnoremap <leader>- :res -5<CR>

nnoremap <silent> <leader> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader>l

" LSPSaga Mappings
" -- lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" -- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" Trouble Keymappings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <silent>gr <cmd>TroubleToggle lsp_references<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>m :MaximizerToggle!<CR>

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

  require('auto-session').setup {
    log_level = 'info',
    auto_session_suppress_dirs = {'~/', '~/Projects'}
  }

  require("lang")
  require("treesitter")
  require("statusbar")
  require("completion")
  require("telescope_integration")
  require("prettiness")
--  require("keymaps")
EOF

" lua <<EOF
"   require("rust-tools").setup({})
" EOF
