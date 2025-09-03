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
local package_path_str = "/home/krivah/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/krivah/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/krivah/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/krivah/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/krivah/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.luasnip\frequire\0" },
    load_after = {
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nÑ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\5\0\0\a~/\15~/Projects\r~/github\17~/Playground\1\0\5\22auto_save_enabled\2\14log_level\twarn auto_session_use_git_branch\2 auto_session_create_enabled\1\31auto_session_suppress_dirs\0\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufdelete.nvim"] = {
    commands = { "Bdelete", "Bwipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dictionary"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.lua" },
    config = { "\27LJ\2\nå\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\bdic\1\0\4\ndebug\1\bdic\0\nasync\1\17exact_length\3\2\1\0\1\6*\26/usr/share/dict/words\nsetup\19cmp_dictionary\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-digraphs"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-digraphs/after/plugin/cmp_digraphs.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-digraphs",
    url = "https://github.com/dmitmel/cmp-digraphs"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-git"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-git",
    url = "https://github.com/hrsh7th/cmp-git"
  },
  ["cmp-npm"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcmp-npm\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lspconfig" },
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-rg/after/plugin/cmp-rg.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-under-comparator"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    after_files = { "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcodeium\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/codeium.nvim",
    url = "https://github.com/jcdickinson/codeium.nvim"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.crates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  ["diaglist.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/diaglist.nvim",
    url = "https://github.com/onsails/diaglist.nvim"
  },
  ["diffview.nvim"] = {
    commands = { "Diffview*" },
    cond = { "\27LJ\2\nò\1\0\0\6\0\a\0\0176\0\0\0009\0\1\0009\0\2\0005\2\3\0006\3\0\0009\3\1\0039\3\4\3'\5\5\0B\3\2\2>\3\3\2B\0\2\2\6\0\6\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\ntrue\n\n%:p:h\vexpand\1\6\0\0\bgit\a-C\0\14rev-parse\26--is-inside-work-tree\vsystem\afn\bvim\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.diffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dirbuf.nvim"] = {
    commands = { "Dirbuf*" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.dressing\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.fidget\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    after = { "LuaSnip" },
    load_after = {
      ["vim-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    commands = { "FzfLua" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.fzf-lua\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["fzf-tmux.nvim"] = {
    cond = { "\27LJ\2\n)\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\fneovide\6g\bvim\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.fzf-tmux\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/fzf-tmux.nvim",
    url = "/home/krivah/github/fzf-tmux.nvim"
  },
  ["gitsigns.nvim"] = {
    cond = { "\27LJ\2\nò\1\0\0\6\0\a\0\0176\0\0\0009\0\1\0009\0\2\0005\2\3\0006\3\0\0009\3\1\0039\3\4\3'\5\5\0B\3\2\2>\3\3\2B\0\2\2\6\0\6\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\ntrue\n\n%:p:h\vexpand\1\6\0\0\bgit\a-C\0\14rev-parse\26--is-inside-work-tree\vsystem\afn\bvim\0" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["heirline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.heirline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15krivah.hop\frequire\0" },
    keys = { { "n", "<leader>e" }, { "n", "<leader>E" }, { "n", "s" }, { "n", "S" }, { "x", "s" }, { "x", "S" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/smoka7/hop.nvim"
  },
  ["icon-picker.nvim"] = {
    commands = { "Pick*" },
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16icon-picker\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/icon-picker.nvim",
    url = "https://github.com/ziontee113/icon-picker.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.indent\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    commands = { "ISwap" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25krivah.lsp_signature\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.lspsaga\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/nvimdev/lspsaga.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17krivah.marks\frequire\0" },
    keys = { { "n", "m" }, { "n", "dm" }, { "n", "'" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["neodev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    cond = { "\27LJ\2\nò\1\0\0\6\0\a\0\0176\0\0\0009\0\1\0009\0\2\0005\2\3\0006\3\0\0009\3\1\0039\3\4\3'\5\5\0B\3\2\2>\3\3\2B\0\2\2\6\0\6\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\ntrue\n\n%:p:h\vexpand\1\6\0\0\bgit\a-C\0\14rev-parse\26--is-inside-work-tree\vsystem\afn\bvim\0" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.neogit\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neomutt.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/neomutt.vim",
    url = "https://github.com/neomutt/neomutt.vim"
  },
  ["noice.nvim"] = {
    commands = { "Noice" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nnoice\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["none-ls.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.null-ls\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22krivah.bufferline\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-git", "cmp-path", "cmp-rg", "cmp_luasnip", "cmp-spell", "cmp-buffer", "cmp-nvim-lua", "cmp-cmdline", "cmp-emoji", "cmp-digraphs", "cmp-dictionary", "cmp-treesitter", "codeium.nvim", "cmp-nvim-lsp", "cmp-calc", "cmp-npm" },
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15krivah.cmp\frequire\0" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorword"] = {
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/nvim-cursorword",
    url = "https://github.com/xiyaowong/nvim-cursorword"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-virtual-text" },
    commands = { "Dap*" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-gomove"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.gomove\frequire\0" },
    keys = { { "x", "<C-Right>" }, { "x", "<C-Left>" }, { "x", "<C-Up>" }, { "x", "<C-Down>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-gomove",
    url = "https://github.com/booperlv/nvim-gomove"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n—\1\0\0\a\0\t\0\f6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\4=\4\b\3B\0\3\1K\0\1\0\rcallback\21update_lightbulb\19nvim-lightbulb\frequire\1\0\3\rcallback\0\tdesc\26Lightbulb autocommand\fpattern\6*\1\3\0\0\15CursorHold\16CursorHoldI\24nvim_create_autocmd\bapi\bvim\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    after = { "none-ls.nvim", "fidget.nvim", "lsp_signature.nvim", "lspsaga.nvim", "nvim-lightbulb" },
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15krivah.lsp\frequire\0" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.notify\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16krivah.tree\frequire\0" },
    keys = { { "", "<C-n>" }, { "", "<leader>n" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22krivah.treesitter\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-hint-textobject"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16krivah.tsht\frequire\0" },
    keys = { { "n", "<leader>m" }, { "x", "in" }, { "o", "in" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-ts-hint-textobject",
    url = "https://github.com/mfussenegger/nvim-ts-hint-textobject"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15krivah.oil\frequire\0" },
    keys = { { "n", "<leader>o" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor", "TSNodeUnderCursor" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\nµ\3\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\2B\0\2\1K\0\1\0\16file_assets\14blacklist\1\0\16\14show_time\2\14log_level\0\fbuttons\2\14blacklist\0\23enable_line_number\2\21debounce_timeout\3\n\15main_image\tfile\16auto_update\2\16file_assets\0\24plugin_manager_text\21Managing plugins\17reading_text\15Reading %s\20git_commit_text\23Committing changes\19workspace_text\18Working on %s\23file_explorer_text\16Browsing %s\21line_number_text\22Line %s out of %s\17editing_text\15Editing %s\nsetup\rpresence\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["rainbow-delimiters.nvim"] = {
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/rainbow-delimiters.nvim",
    url = "https://github.com/hiphish/rainbow-delimiters.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\16refactoring\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16krivah.rest\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["scope.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nscope\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "https://github.com/tiagovla/scope.nvim"
  },
  ["searchbox.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21krivah.searchbox\frequire\0" },
    keys = { { "", "<leader>ss" }, { "", "<leader>sS" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/searchbox.nvim",
    url = "https://github.com/VonHeikemen/searchbox.nvim"
  },
  ["silicon.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.silicon\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/silicon.nvim",
    url = "/home/krivah/github/silicon.nvim"
  },
  sniprun = {
    commands = { "Snip*" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.sniprun\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["stickybuf.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stickybuf\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/stickybuf.nvim",
    url = "https://github.com/stevearc/stickybuf.nvim"
  },
  ["tailwind-tools.nvim"] = {
    commands = { "Tailwind*" },
    config = { "\27LJ\2\n∑\2\0\0\5\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0024\3\0\0=\3\n\2B\0\2\1K\0\1\0\21custom_filetypes\fconceal\14highlight\1\0\1\afg\f#38BDF8\1\0\4\fenabled\1\vsymbol\nÛ±èø \15min_length\3\30\14highlight\0\19document_color\1\0\3\19document_color\0\21custom_filetypes\0\fconceal\0\1\0\4\tkind\vinline\18inline_symbol\nÛ∞ù§ \fenabled\2\rdebounce\3»\1\nsetup\19tailwind-tools\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/tailwind-tools.nvim",
    url = "https://github.com/luckasRanarison/tailwind-tools.nvim"
  },
  ["telescope-undo.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\28<cmd>Telescope undo<cr>\14<leader>u\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "<leader>u" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/telescope-undo.nvim",
    url = "https://github.com/debugloop/telescope-undo.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21krivah.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22krivah.toggleterm\frequire\0" },
    keys = { { "", "<leader>tt" }, { "", "<leader>tf" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  treesj = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vtreesj\frequire\0" },
    keys = { { "n", "<space>m" }, { "n", "<space>j" }, { "n", "<space>s" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["typst.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/typst.vim",
    url = "https://github.com/kaarmu/typst.vim"
  },
  ["vgit.nvim"] = {
    commands = { "VGit" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tvgit\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/vgit.nvim",
    url = "https://github.com/tanvirtin/vgit.nvim"
  },
  ["vim-exchange"] = {
    keys = { { "n", "cx" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-nightfly-guicolors"] = {
    after = { "nvim-notify", "dressing.nvim" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.nightfly\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-snippets"] = {
    after = { "friendly-snippets" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-sxhkdrc"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/vim-sxhkdrc",
    url = "https://github.com/baskerville/vim-sxhkdrc"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.zen-mode\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/krivah/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^Comment"] = "Comment.nvim",
  ["^cmp%-under%-comparator"] = "cmp-under-comparator",
  ["^dap"] = "nvim-dap",
  ["^diaglist"] = "diaglist.nvim",
  ["^fzf%-lua"] = "fzf-lua",
  ["^hop"] = "hop.nvim",
  ["^marks"] = "marks.nvim",
  ["^neodev"] = "neodev.nvim",
  ["^nui"] = "nui.nvim",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^refactoring"] = "refactoring.nvim",
  ["^telescope"] = "telescope.nvim",
  ["^ts_context_commentstring"] = "nvim-ts-context-commentstring",
  ["^tsht"] = "nvim-ts-hint-textobject",
  ["^twilight"] = "twilight.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: scope.nvim
time([[Config for scope.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nscope\frequire\0", "config", "scope.nvim")
time([[Config for scope.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22krivah.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: stickybuf.nvim
time([[Config for stickybuf.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stickybuf\frequire\0", "config", "stickybuf.nvim")
time([[Config for stickybuf.nvim]], false)
-- Config for: vim-nightfly-guicolors
time([[Config for vim-nightfly-guicolors]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.nightfly\frequire\0", "config", "vim-nightfly-guicolors")
time([[Config for vim-nightfly-guicolors]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nÑ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\5\0\0\a~/\15~/Projects\r~/github\17~/Playground\1\0\5\22auto_save_enabled\2\14log_level\twarn auto_session_use_git_branch\2 auto_session_create_enabled\1\31auto_session_suppress_dirs\0\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.indent\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: silicon.nvim
time([[Config for silicon.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19krivah.silicon\frequire\0", "config", "silicon.nvim")
time([[Config for silicon.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\nµ\3\0\0\4\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\2B\0\2\1K\0\1\0\16file_assets\14blacklist\1\0\16\14show_time\2\14log_level\0\fbuttons\2\14blacklist\0\23enable_line_number\2\21debounce_timeout\3\n\15main_image\tfile\16auto_update\2\16file_assets\0\24plugin_manager_text\21Managing plugins\17reading_text\15Reading %s\20git_commit_text\23Committing changes\19workspace_text\18Working on %s\23file_explorer_text\16Browsing %s\21line_number_text\22Line %s out of %s\17editing_text\15Editing %s\nsetup\rpresence\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22krivah.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Conditional loads
time([[Conditional loading of fzf-tmux.nvim]], true)
  require("packer.load")({"fzf-tmux.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of fzf-tmux.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-notify ]]

-- Config for: nvim-notify
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18krivah.notify\frequire\0", "config", "nvim-notify")

vim.cmd [[ packadd dressing.nvim ]]

-- Config for: dressing.nvim
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20krivah.dressing\frequire\0", "config", "dressing.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Noice', function(cmdargs)
          require('packer.load')({'noice.nvim'}, { cmd = 'Noice', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'noice.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Noice ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Tailwind* ++once lua require"packer.load"({'tailwind-tools.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Dap* ++once lua require"packer.load"({'nvim-dap'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'Bdelete', function(cmdargs)
          require('packer.load')({'bufdelete.nvim'}, { cmd = 'Bdelete', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'bufdelete.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Bdelete ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FzfLua', function(cmdargs)
          require('packer.load')({'fzf-lua'}, { cmd = 'FzfLua', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf-lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FzfLua ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Dirbuf* ++once lua require"packer.load"({'dirbuf.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'Bwipeout', function(cmdargs)
          require('packer.load')({'bufdelete.nvim'}, { cmd = 'Bwipeout', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'bufdelete.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Bwipeout ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Trouble', function(cmdargs)
          require('packer.load')({'trouble.nvim'}, { cmd = 'Trouble', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'trouble.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Trouble ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Pick* ++once lua require"packer.load"({'icon-picker.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'TSNodeUnderCursor', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSNodeUnderCursor', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSNodeUnderCursor ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Diffview* ++once lua require"packer.load"({'diffview.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'ISwap', function(cmdargs)
          require('packer.load')({'iswap.nvim'}, { cmd = 'ISwap', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'iswap.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ISwap ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ZenMode', function(cmdargs)
          require('packer.load')({'zen-mode.nvim'}, { cmd = 'ZenMode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'zen-mode.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ZenMode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogit', function(cmdargs)
          require('packer.load')({'neogit'}, { cmd = 'Neogit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogit'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neogit ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Snip* ++once lua require"packer.load"({'sniprun'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'TSPlaygroundToggle', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSPlaygroundToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSPlaygroundToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'VGit', function(cmdargs)
          require('packer.load')({'vgit.nvim'}, { cmd = 'VGit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vgit.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('VGit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TSHighlightCapturesUnderCursor', function(cmdargs)
          require('packer.load')({'playground'}, { cmd = 'TSHighlightCapturesUnderCursor', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'playground'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSHighlightCapturesUnderCursor ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <C-n> <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>C-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>sS <cmd>lua require("packer.load")({'searchbox.nvim'}, { keys = "<lt>leader>sS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> S <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <space>j <cmd>lua require("packer.load")({'treesj'}, { keys = "<lt>space>j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> in <cmd>lua require("packer.load")({'nvim-ts-hint-textobject'}, { keys = "in", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> s <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>E <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "<lt>leader>E", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> in <cmd>lua require("packer.load")({'nvim-ts-hint-textobject'}, { keys = "in", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-Down> <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>C-Down>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>e <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "<lt>leader>e", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>u <cmd>lua require("packer.load")({'telescope-undo.nvim'}, { keys = "<lt>leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>ss <cmd>lua require("packer.load")({'searchbox.nvim'}, { keys = "<lt>leader>ss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>tt <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>leader>tt", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ' <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "'", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-Right> <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>C-Right>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> dm <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "dm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> m <cmd>lua require("packer.load")({'marks.nvim'}, { keys = "m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <space>m <cmd>lua require("packer.load")({'treesj'}, { keys = "<lt>space>m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>tf <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>leader>tf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> s <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>m <cmd>lua require("packer.load")({'nvim-ts-hint-textobject'}, { keys = "<lt>leader>m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <space>s <cmd>lua require("packer.load")({'treesj'}, { keys = "<lt>space>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-Left> <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>C-Left>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>o <cmd>lua require("packer.load")({'oil.nvim'}, { keys = "<lt>leader>o", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> <C-Up> <cmd>lua require("packer.load")({'nvim-gomove'}, { keys = "<lt>C-Up>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
vim.cmd [[au BufRead sxhkdrc ++once lua require("packer.load")({'vim-sxhkdrc'}, { event = "BufRead sxhkdrc" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-snippets', 'gitsigns.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead *.typ ++once lua require("packer.load")({'typst.vim'}, { event = "BufRead *.typ" }, _G.packer_plugins)]]
vim.cmd [[au BufRead *.http ++once lua require("packer.load")({'rest.nvim'}, { event = "BufRead *.http" }, _G.packer_plugins)]]
vim.cmd [[au UiEnter * ++once lua require("packer.load")({'heirline.nvim'}, { event = "UiEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead *muttrc ++once lua require("packer.load")({'neomutt.vim'}, { event = "BufRead *muttrc" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'todo-comments.nvim', 'FixCursorHold.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'FixCursorHold.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
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
