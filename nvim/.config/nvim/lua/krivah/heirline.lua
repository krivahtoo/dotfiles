local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local heirline = require("heirline")

local icons = require('krivah.icons')

local colors = require("nightfly").palette

local Align = { provider = "%=" }
local Space = { provider = " " }

local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    mode_names = { -- change the strings if you like it vvvvverbose!
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
    return "󰣇 %2(" .. self.mode_names[self.mode] .. "%)"
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local color = self:mode_color() -- here!
    return { fg = color, bg = 'dark_blue', bold = true }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- Also allows the statusline to be re-evaluated when entering operator-pending mode
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}
local FileNameBlock = {
  -- let's first set up some attributes needed by this component and its children
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}
-- We can now define some children separately and add them later

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

local WorkDir = {
  init = function(self)
    local cwd = vim.fn.getcwd(0)
    self.cwd = vim.fn.fnamemodify(cwd, ":~")
  end,
  hl = { fg = "blue", bold = true },

  flexible = 1,

  {
    -- evaluates to the full-lenth path
    provider = function(self)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.cwd .. trail .. ""
    end,
  },
  {
    -- evaluates to the shortened path
    provider = function(self)
      local cwd = vim.fn.pathshorten(self.cwd)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return cwd .. trail .. ""
    end,
  },
  {
    -- evaluates to "", hiding the component
    provider = "",
  }
}

local FileName = {
  init = function(self)
    self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
    if self.lfilename == "" then self.lfilename = "[No Name]" end
  end,
  hl = { fg = utils.get_highlight("Directory").fg },

  flexible = 4,

  {
    provider = function(self)
      return self.lfilename
    end,
  },
  {
    provider = function(self)
      return vim.fn.pathshorten(self.lfilename)
    end,
  },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = " ",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = "orange" },
  },
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { fg = "cyan", bold = true, force = true }
    end
  end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
  FileIcon,
  WorkDir,
  utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
  FileFlags,
  { provider = '%<' }                      -- this means that the statusline is cut here when there's not enough space
)

local FileType = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

-- We're getting minimalist here!
local Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = "%7(%l/%3L%):%2c %P",
  hl = { fg = "steel_blue" },
}

-- I take no credits for this! 🦁
local ScrollBar = {
  static = {
    -- sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    -- Another variant, because the more choice the better.
    sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = function(self)
    local color = self:mode_color() -- here!
    return { fg = color, bg = 'dark_blue' }
  end,
}

local LSPActive = {
  condition = conditions.lsp_attached,
  -- update = { 'LspAttach', 'LspDetach' },

  -- You can keep it simple,
  flexible = 3,
  {
    provider = function()
      local names = {}
      for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
        table.insert(names, server.name)
      end
      return "  [" .. table.concat(names, " ") .. "]"
    end,
  },
  {
    provider = "  [LSP]",
  },
  {
    provider = " ",
  },
  hl = function(self)
    local color = self:mode_color() -- here!
    return { fg = color }
  end,
}

local Diagnostics = {

  condition = conditions.has_diagnostics,

  -- Fetching custom diagnostic icons
  static = {
    error_icon = icons.diagnostics.Error,
    warn_icon = icons.diagnostics.Warning,
    info_icon = icons.diagnostics.Information,
    hint_icon = icons.diagnostics.Hint,
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = "",
    hl = { fg = "dark_blue" },
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. " ")
    end,
    hl = { fg = "red", bg = "dark_blue" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
    end,
    hl = { fg = "yellow", bg = "dark_blue" },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. " ")
    end,
    hl = { fg = "turquoise", bg = "dark_blue" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = { fg = "turquoise", bg = "dark_blue" },
  },
  {
    provider = "",
    hl = { fg = "dark_blue" },
  },
}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict or { head = "", added = 0, removed = 0, changed = 0 }
    self.has_changes = (self.status_dict.added ~= 0)
        or (self.status_dict.removed ~= 0)
        or (self.status_dict.changed ~= 0)
  end,

  hl = { fg = "orange" },


  { -- git branch name
    provider = " ",
    hl = { fg = "red" }
  },
  { -- git branch name
    provider = function(self)
      return self.status_dict.head
    end,
    hl = { fg = "ash_blue" }
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = " "
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" " .. count)
    end,
    hl = "GitSignsAdd",
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. count)
    end,
    hl = "GitSignsDelete",
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. count)
    end,
    hl = "GitSignsChange",
  },
}

local HelpFileName = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = { fg = "blue" },
}

local Snippets = {
  -- check that we are in insert or select mode
  condition = function()
    return vim.tbl_contains({ 's', 'i' }, vim.fn.mode()) and
        (require("luasnip").jumpable(1) or require("luasnip").jumpable(1))
  end,
  hl = { fg = "watermelon", bold = true },
  Space,
  {
    provider = function()
      local forward = require("luasnip").jumpable(1) and "󰮺" or ""
      local backward = require("luasnip").jumpable(-1) and "󰮹" or ""
      return backward .. forward
    end,
  }
}

local TerminalName = {
  -- we could add a condition to check that buftype == 'terminal'
  -- or we could do that later (see #conditional-statuslines below)
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    return " " .. tname
  end,
  hl = { fg = "blue", bold = true },
}

ViMode = utils.surround({ "", "" }, 'dark_blue', { ViMode, Snippets })

local DefaultStatusline = {
  ViMode, Space, FileNameBlock, Space, Git, Space, Diagnostics,
  Align,
  LSPActive, Space, FileType, Space, Ruler, Space, ScrollBar
}

local InactiveStatusline = {
  condition = conditions.is_not_active,
  FileType,
  Space,
  FileName,
  Align,
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive", "oil" },
    })
  end,

  FileType,
  Space,
  HelpFileName,
  Align
}

local TerminalStatusline = {

  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,

  hl = { bg = "regal_blue" },

  -- Quickly add a condition to the ViMode to only show it when buffer is active!
  { condition = conditions.is_active, ViMode, Space },
  FileType,
  Space,
  TerminalName,
  Align,
}

local StatusLines = {
  static = {
    mode_colors_map = {
      n = "blue",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan",
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = "red",
      t = "green",
    },
    mode_color = function(self)
      -- local mode = conditions.is_active() and vim.fn.mode() or "n"
      local mode_colors = {
        [110] = colors.green,
        [105] = colors.blue,
        [99] = colors.orange,
        [116] = colors.blue,
        [118] = colors.purple,
        [22] = colors.purple,
        [86] = colors.purple,
        [82] = colors.red,
        [115] = colors.red,
        [83] = colors.red,
      }

      local color = mode_colors[vim.fn.mode():byte()]
      if color ~= nil then
        return color
      else
        return colors.purple
      end
      -- return self.mode_colors_map[mode]
    end,
  },

  hl = function()
    if conditions.is_active() then
      return { bg = "#010e19" }
    else
      return { bg = "bg" }
    end
  end,

  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  SpecialStatusline,
  TerminalStatusline,
  InactiveStatusline,
  DefaultStatusline,
}

heirline.setup({
  statusline = StatusLines,
  opts = {
    colors = colors,
  },
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "WinEnter", "WinResized", "BufEnter", "TermEnter" }, {
  callback = function()
    -- force heirline to re-apply
    vim.o.statusline = "%{%v:lua.require'heirline'.eval_statusline()%}"
  end,
})
