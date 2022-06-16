require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      --["foo.bar"] = "Identifier",
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      vim = '" %s',
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
    enable = true,
  },
}
-- require'treesitter-context'.setup{}
require 'krivah.gps'
