require("trouble").setup {
  auto_close = true
}

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup {
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

require("telescope").load_extension("ui-select")
