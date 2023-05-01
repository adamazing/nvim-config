local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        --
      }
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<c-h>"] = "which_key",
        ["<c-t>"] = trouble.open_with_trouble,
        ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<c-r>"] = actions.delete_buffer
      },
      n = {
        ["<c-t>"] = trouble.open_with_trouble,
        ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<c-r>"] = actions.delete_buffer
      },
    },
    file_ignore_patterns = {
      ".git/",
      "yarn.lock",
      "Gemfile.lock",
      ".cache",
      "%.pdf",
      "%.jpg",
      "%.png",
      "%.mp4",
      "%.o",
      "%.a",
      "%.out"
    },
    vimgrep_arguments = { 'rg',
                            '--hidden',
                            '--color=never',
                            '--no-heading',
                            '--with-filename',
                            '--line-number',
                            '--column',
                            '--smart-case'
                        }
  },
}

imap ("<Leader>fe", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>");
nmap ("<Leader>fb", "<cmd>Telescope buffers<cr>");
nmap ("<Leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
nmap ("<Leader>fg", "<cmd>Telescope live_grep<cr>");
nmap ("<Leader>fh", "<cmd>Telescope help_tags<cr>");
nmap ("<Leader>fp", "<cmd>lua require'telescope.builtin'.builtin()<cr>");
nmap ("<Leader>fq", "<cmd>lua require'telescope.builtin'.quickfix()<cr>");
nmap ("<Leader>fs", "<cmd>Telescope grep_string<cr>");
nmap ("<Leader>ft", "<cmd>lua require'telescope.builtin'.treesitter()<cr>");
-- Search file changes (according to git)
nmap ("<Leader>fc", "<cmd>lua require'telescope.builtin'.git_status{}<cr>");
nmap("<Leader>fu", "<cmd>lua require'telescope.builtin'.colorscheme{enable_preview = true}<cr>");

-- get a list of definitions or jump to a sole definition
nmap("gd", ":lua require'telescope.builtin'.lsp_definitions{}<cr>")
-- get a list of implementations for word under cursor or jump to sole implementation
nmap("gi", ":lua require'telescope.builtin'.lsp_implementations{}<cr>")

require("telescope").load_extension("ui-select")
