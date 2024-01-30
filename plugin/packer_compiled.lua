-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/adam/.cache/nvim/packer_hererocks/2.1.1700008891/share/lua/5.1/?.lua;/Users/adam/.cache/nvim/packer_hererocks/2.1.1700008891/share/lua/5.1/?/init.lua;/Users/adam/.cache/nvim/packer_hererocks/2.1.1700008891/lib/luarocks/rocks-5.1/?.lua;/Users/adam/.cache/nvim/packer_hererocks/2.1.1700008891/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/adam/.cache/nvim/packer_hererocks/2.1.1700008891/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\nô\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\5\nmason\2\16ts_rainbow2\2\rnvimtree\2\15treesitter\2\rgitsigns\2\1\0\1\fflavour\nmocha\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    commands = { "Copilot" },
    config = { "\27LJ\2\nu\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\npanel\1\0\1\fenabled\1\15suggestion\1\0\0\1\0\1\fenabled\1\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\nÑ\1\0\0\4\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\5\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\14overrides\1\0\1\rcontrast\5\nsetup\fgruvbox\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/adamazing/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mintabline.vim"] = {
    config = { "\27LJ\2\nI\0\0\t\0\3\0\14)\0\1\0)\1\t\0)\2\1\0M\0\tÄ6\4\0\0\18\6\3\0'\a\1\0&\6\a\6\18\a\3\0'\b\2\0&\a\b\aB\4\3\1O\0˜\127K\0\1\0\agt\6,\tnmap\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/mintabline.vim",
    url = "https://github.com/sangdol/mintabline.vim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-regexplainer"] = {
    config = { "\27LJ\2\nK\0\1\b\0\3\0\14'\1\0\0009\2\1\0)\3\0\0\1\3\2\0X\2\bÄ)\2\1\0009\3\1\0)\4\1\0M\2\4Ä\18\6\1\0'\a\2\0&\1\a\6O\2¸\127L\1\2\0\a> \ndepth\a\n Í\1\1\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\0025\3\r\0003\4\f\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\14narrative\14separator\1\0\0\0\npopup\vborder\1\0\0\fpadding\1\0\1\nstyle\vshadow\1\3\0\0\3\1\3\2\14filetypes\1\a\0\0\thtml\ajs\bjsx\vpython\truby\trust\1\0\1\tauto\2\nsetup\17regexplainer\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-regexplainer",
    url = "https://github.com/bennypowers/nvim-regexplainer"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nº\2\0\0\5\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0'\2\r\0'\3\14\0B\0\3\0016\0\f\0'\2\15\0'\3\16\0B\0\3\1K\0\1\0\26:NvimTreeFindFile<CR>\15<C-bslash>\24:NvimTreeToggle<CR>\14<Leader>t\tnmap\rrenderer\18special_files\1\0\0\1\4\0\0\14README.md\rMakefile\rMAKEFILE\16diagnostics\1\0\1\venable\2\23hijack_directories\1\0\0\1\0\2\venable\2\14auto_open\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow2"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow2",
    url = "https://github.com/HiPhish/nvim-ts-rainbow2"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\ní\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\bzsh\1\0\0\1\0\3\ticon\bÓûï\tname\bZsh\ncolor\f#428850\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  rainbow_csv = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/rainbow_csv",
    url = "https://github.com/mechatroner/rainbow_csv"
  },
  ["react-extract.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18react-extract\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/opt/react-extract.nvim",
    url = "https://github.com/napmn/react-extract.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\nü\2\0\0\5\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\b\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\3=\3\v\2B\0\2\1K\0\1\0\ftabouts\1\0\2\nclose\6]\topen\6#\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\2\21ignore_beginning\2\15completion\2\nsetup\vtabout\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["treesitter-unit"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/treesitter-unit",
    url = "https://github.com/David-Kunz/treesitter-unit"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nó\4\0\0\4\0\19\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0B\0\3\0016\0\6\0'\2\t\0'\3\n\0B\0\3\0016\0\6\0'\2\v\0'\3\f\0B\0\3\0016\0\6\0'\2\r\0'\3\14\0B\0\3\0016\0\6\0'\2\15\0'\3\16\0B\0\3\0016\0\6\0'\2\17\0'\3\18\0B\0\3\1K\0\1\0*<cmd>TroubleToggle lsp_references<cr>\agr#<cmd>TroubleToggle loclist<cr>\15<Leader>xl$<cmd>TroubleToggle quickfix<cr>\15<Leader>xq0<cmd>TroubleToggle document_diagnostics<cr>\15<Leader>xd1<cmd>TroubleToggle workspace_diagnostics<cr>\15<Leader>xw\27<cmd>TroubleToggle<cr>\15<Leader>xx\tnmap\nsigns\1\0\5\nother\bÔ´†\16information\bÔëâ\thint\bÔ†µ\nerror\bÔôô\fwarning\bÔî©\1\0\2\15auto_close\2\20use_diagnostics\1\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0B\0\3\1K\0\1\0\18:Twilight<CR>\15<Leader>tw\tnmap\fdimming\1\0\0\1\0\1\nalpha\4≥ÊÃô\3≥Êå˛\3\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-maximizer"] = {
    config = { "\27LJ\2\nö\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\1\0'\3\4\0B\0\3\0016\0\5\0'\2\1\0'\3\6\0B\0\3\1K\0\1\0\30<C-o>:MaximizerToggle<CR>\timap\27:MaximizerToggle<CR>gv\tvmap\25:MaximizerToggle<CR>\14<Leader>z\tnmap\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-slime"] = {
    config = { "\27LJ\2\n®\3\0\0\4\0\16\0\0256\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\4\0'\3\5\0B\0\3\0016\0\3\0'\2\6\0'\3\a\0B\0\3\0016\0\3\0'\2\b\0'\3\t\0B\0\3\0016\0\n\0009\0\v\0'\1\r\0=\1\f\0006\0\n\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0g        let g:slime_default_config = { \"socket_name\": \"default\", \"target_pane\": \"{right}\" }\n      \bcmd\ttmux\17slime_target\6g\bvim7:SlimeSend0 'rspec '.expand('%').':'.line('.')<CR>\15<C-c><C-n>):SlimeSend0 'rspec '.expand('%')<CR>\15<C-c><C-r> :SlimeSend0 expand('%')<CR>\15<C-c><C-f>\tnmap\24:'<,'>SlimeSend<CR>\15<C-c><C-c>\tvmap\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-slime",
    url = "https://github.com/jpalardy/vim-slime"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n‚\1\0\0\4\0\v\0\0216\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\6\0B\0\3\0016\0\0\0'\2\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0'\3\n\0B\0\3\1K\0\1\0\19:TestVisit<CR>\15<Leader>rV\19:TestSuite<CR>\15<Leader>ra\18:TestLast<CR>\15<Leader>rl\21:TestNearest<CR>\15<Leader>rt\18:TestFile<CR>\15<Leader>rT\tnmap\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimspector = {
    config = { "\27LJ\2\n·\3\0\0\4\0\20\0%6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\6\0'\2\a\0'\3\b\0B\0\3\0016\0\6\0'\2\t\0'\3\n\0B\0\3\0016\0\6\0'\2\v\0'\3\f\0B\0\3\0016\0\6\0'\2\r\0'\3\14\0B\0\3\0016\0\6\0'\2\15\0'\3\16\0B\0\3\0016\0\6\0'\2\17\0'\3\18\0B\0\3\0016\0\19\0'\2\17\0'\3\18\0B\0\3\1K\0\1\0\txmap <Plug>VimspectorBalloonEval\15<Leader>di\26:VimspectorShowOutput\15<Leader>do\21:VimspectorWatch\15<Leader>dw\20:VimspectorEval\15<Leader>de\25:VimspectorReset<CR>\15<Leader>dr\":call vimspector#Launch()<CR>\15<Leader>dd\tnmap\1\5\0\0\fdebugpy\14vscode-go\rCodeLLDB\23vscode-node-debug1\31vimspector_install_gadgets\nHUMAN\31vimspector_enable_mappings\6g\bvim\0" },
    loaded = true,
    path = "/Users/adam/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: vim-maximizer
time([[Config for vim-maximizer]], true)
try_loadstring("\27LJ\2\nö\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\1\0'\3\4\0B\0\3\0016\0\5\0'\2\1\0'\3\6\0B\0\3\1K\0\1\0\30<C-o>:MaximizerToggle<CR>\timap\27:MaximizerToggle<CR>gv\tvmap\25:MaximizerToggle<CR>\14<Leader>z\tnmap\0", "config", "vim-maximizer")
time([[Config for vim-maximizer]], false)
-- Config for: nvim-regexplainer
time([[Config for nvim-regexplainer]], true)
try_loadstring("\27LJ\2\nK\0\1\b\0\3\0\14'\1\0\0009\2\1\0)\3\0\0\1\3\2\0X\2\bÄ)\2\1\0009\3\1\0)\4\1\0M\2\4Ä\18\6\1\0'\a\2\0&\1\a\6O\2¸\127L\1\2\0\a> \ndepth\a\n Í\1\1\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\0025\3\r\0003\4\f\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\14narrative\14separator\1\0\0\0\npopup\vborder\1\0\0\fpadding\1\0\1\nstyle\vshadow\1\3\0\0\3\1\3\2\14filetypes\1\a\0\0\thtml\ajs\bjsx\vpython\truby\trust\1\0\1\tauto\2\nsetup\17regexplainer\frequire\0", "config", "nvim-regexplainer")
time([[Config for nvim-regexplainer]], false)
-- Config for: vim-slime
time([[Config for vim-slime]], true)
try_loadstring("\27LJ\2\n®\3\0\0\4\0\16\0\0256\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\3\0'\2\4\0'\3\5\0B\0\3\0016\0\3\0'\2\6\0'\3\a\0B\0\3\0016\0\3\0'\2\b\0'\3\t\0B\0\3\0016\0\n\0009\0\v\0'\1\r\0=\1\f\0006\0\n\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0g        let g:slime_default_config = { \"socket_name\": \"default\", \"target_pane\": \"{right}\" }\n      \bcmd\ttmux\17slime_target\6g\bvim7:SlimeSend0 'rspec '.expand('%').':'.line('.')<CR>\15<C-c><C-n>):SlimeSend0 'rspec '.expand('%')<CR>\15<C-c><C-r> :SlimeSend0 expand('%')<CR>\15<C-c><C-f>\tnmap\24:'<,'>SlimeSend<CR>\15<C-c><C-c>\tvmap\0", "config", "vim-slime")
time([[Config for vim-slime]], false)
-- Config for: tabout.nvim
time([[Config for tabout.nvim]], true)
try_loadstring("\27LJ\2\nü\2\0\0\5\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\b\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\0035\4\n\0>\4\a\3=\3\v\2B\0\2\1K\0\1\0\ftabouts\1\0\2\nclose\6]\topen\6#\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\2\21ignore_beginning\2\15completion\2\nsetup\vtabout\frequire\0", "config", "tabout.nvim")
time([[Config for tabout.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\4\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\5\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\14overrides\1\0\1\rcontrast\5\nsetup\fgruvbox\frequire\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n‚\1\0\0\4\0\v\0\0216\0\0\0'\2\1\0'\3\2\0B\0\3\0016\0\0\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0'\2\5\0'\3\6\0B\0\3\0016\0\0\0'\2\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0'\3\n\0B\0\3\1K\0\1\0\19:TestVisit<CR>\15<Leader>rV\19:TestSuite<CR>\15<Leader>ra\18:TestLast<CR>\15<Leader>rl\21:TestNearest<CR>\15<Leader>rt\18:TestFile<CR>\15<Leader>rT\tnmap\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nô\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\5\nmason\2\16ts_rainbow2\2\rnvimtree\2\15treesitter\2\rgitsigns\2\1\0\1\fflavour\nmocha\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nó\4\0\0\4\0\19\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0B\0\3\0016\0\6\0'\2\t\0'\3\n\0B\0\3\0016\0\6\0'\2\v\0'\3\f\0B\0\3\0016\0\6\0'\2\r\0'\3\14\0B\0\3\0016\0\6\0'\2\15\0'\3\16\0B\0\3\0016\0\6\0'\2\17\0'\3\18\0B\0\3\1K\0\1\0*<cmd>TroubleToggle lsp_references<cr>\agr#<cmd>TroubleToggle loclist<cr>\15<Leader>xl$<cmd>TroubleToggle quickfix<cr>\15<Leader>xq0<cmd>TroubleToggle document_diagnostics<cr>\15<Leader>xd1<cmd>TroubleToggle workspace_diagnostics<cr>\15<Leader>xw\27<cmd>TroubleToggle<cr>\15<Leader>xx\tnmap\nsigns\1\0\5\nother\bÔ´†\16information\bÔëâ\thint\bÔ†µ\nerror\bÔôô\fwarning\bÔî©\1\0\2\15auto_close\2\20use_diagnostics\1\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vimspector
time([[Config for vimspector]], true)
try_loadstring("\27LJ\2\n·\3\0\0\4\0\20\0%6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\6\0'\2\a\0'\3\b\0B\0\3\0016\0\6\0'\2\t\0'\3\n\0B\0\3\0016\0\6\0'\2\v\0'\3\f\0B\0\3\0016\0\6\0'\2\r\0'\3\14\0B\0\3\0016\0\6\0'\2\15\0'\3\16\0B\0\3\0016\0\6\0'\2\17\0'\3\18\0B\0\3\0016\0\19\0'\2\17\0'\3\18\0B\0\3\1K\0\1\0\txmap <Plug>VimspectorBalloonEval\15<Leader>di\26:VimspectorShowOutput\15<Leader>do\21:VimspectorWatch\15<Leader>dw\20:VimspectorEval\15<Leader>de\25:VimspectorReset<CR>\15<Leader>dr\":call vimspector#Launch()<CR>\15<Leader>dd\tnmap\1\5\0\0\fdebugpy\14vscode-go\rCodeLLDB\23vscode-node-debug1\31vimspector_install_gadgets\nHUMAN\31vimspector_enable_mappings\6g\bvim\0", "config", "vimspector")
time([[Config for vimspector]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0B\0\3\1K\0\1\0\18:Twilight<CR>\15<Leader>tw\tnmap\fdimming\1\0\0\1\0\1\nalpha\4≥ÊÃô\3≥Êå˛\3\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: mintabline.vim
time([[Config for mintabline.vim]], true)
try_loadstring("\27LJ\2\nI\0\0\t\0\3\0\14)\0\1\0)\1\t\0)\2\1\0M\0\tÄ6\4\0\0\18\6\3\0'\a\1\0&\6\a\6\18\a\3\0'\b\2\0&\a\b\aB\4\3\1O\0˜\127K\0\1\0\agt\6,\tnmap\0", "config", "mintabline.vim")
time([[Config for mintabline.vim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nº\2\0\0\5\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0'\2\r\0'\3\14\0B\0\3\0016\0\f\0'\2\15\0'\3\16\0B\0\3\1K\0\1\0\26:NvimTreeFindFile<CR>\15<C-bslash>\24:NvimTreeToggle<CR>\14<Leader>t\tnmap\rrenderer\18special_files\1\0\0\1\4\0\0\14README.md\rMakefile\rMAKEFILE\16diagnostics\1\0\1\venable\2\23hijack_directories\1\0\0\1\0\2\venable\2\14auto_open\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\ní\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\bzsh\1\0\0\1\0\3\ticon\bÓûï\tname\bZsh\ncolor\f#428850\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'react-extract.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'react-extract.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
