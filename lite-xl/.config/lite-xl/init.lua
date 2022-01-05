-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
local common = require "core.common"
local lsp = require "plugins.lsp"
-- local font = require "font"
-- local fontconfig = require "plugins.fontconfig"
local path = system.absolute_path -- shorthand to normalise path

------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.nightfly")

--------------------------- Key bindings -------------------------------------

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }


------------------------------- Fonts ----------------------------------------

-- customize fonts:
style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 12 * SCALE)
-- style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 13 * SCALE)
-- style.code_font = renderer.font.load(USERDIR .. "/fonts/VictorMono-Regular.ttf", 14 * SCALE)

renderer.font.group {
  "/usr/share/fonts/TTF/Iosevka Nerd Font Complete Mono.ttf",
  "/usr/share/fonts/joypixels/JoyPixels.ttf"
}

-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code

style.lint = {
  error = { common.color "#eb6772" },
  warning = { common.color "#db9d63" },
  info = { common.color "#9acc76" },
  hint = { common.color "#3e4550" },
}

-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full"}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full

-- fontconfig.use {
--   font = { name = 'sans', size = 13 * SCALE },
--   code_font = { name = 'monospace', size = 13 * SCALE },
-- }

config.fallback_fonts = {}
config.fallback_fonts.enable = false
config.fallback_fonts.preload_range = { lower = 0, upper = 0xFF }
config.fallback_fonts.fontmap_file = path(USERDIR .. "/fontmap.bin")
config.fallback_fonts.fonts = {
  { path = path("/usr/share/fonts/joypixels/JoyPixels.ttf"), size = 13 },
}

config.tab_type = "soft" -- soft for spaces, hard for real tabs (\t)
config.indent_size = 2   -- 2 spaces

-- 😀
------------------------------ Plugins ----------------------------------------

-- enable or disable plugin loading setting config entries:

-- enable plugins.trimwhitespace, otherwise it is disable by default:
-- config.plugins.trimwhitespace = true
--
-- disable detectindent, otherwise it is enabled by default
-- config.plugins.detectindent = false

config.vibe = {}
config.vibe.clipboard_ring_max = 10
config.vibe.debug_str_max = 0

config.vibe.misc_str_max_depth = 8
config.vibe.misc_str_max_list = 4

config.vibe.max_stroke_sugg = 10
config.vibe.stroke_sug_delay = 0.500

-- set this to nil to stop showing. Or to sth else)
config.vibe.permanent_status_tooltip = nil

-- max line difference to join jumplist events
config.vibe.history_max_dline_to_join = 5

-- max time difference to join jumplist events
config.vibe.history_max_dt_to_join = 0.5

-- max number of inline project search items to show
config.vibe.inline_search_maxN = 100



-------------------LSP--------------------------------

lsp.add_server {
  name = "svelteserver",
  language = "svelte",
  file_patterns = {"%.svelte$"},
  command = { "svelteserver", "--stdio" },
  verbose = false
}

lsp.add_server {
  name = "rust-analyzer",
  language = "rust",
  file_patterns = {"%.rs$"},
  command = { "rust-analyzer" },
  verbose = false
}

lsp.add_server {
  name = "clangd",
  language = "c/cpp",
  file_patterns = {
    "%.c$", "%.h$", "%.inl$", "%.cpp$", "%.hpp$",
    "%.cc$", "%.C$", "%.cxx$", "%.c++$", "%.hh$",
    "%.H$", "%.hxx$", "%.h++$", "%.objc$", "%.objcpp$"
  },
  command = { "clangd", "-background-index" },
  verbose = false
}

lsp.add_server {
  name = "lua-language-server",
  language = "lua",
  file_patterns = {"%.lua$"},
  command = { "lua-language-server" },
  verbose = false,
  settings = {
    Lua = {
      completion = {
        enable = true,
        keywordSnippet = "Disable"
      },
      develop = {
        enable = false,
        debuggerPor = 11412,
        debuggerWait = false
      },
      diagnostics = {
        enable = true,
      },
      hover = {
        enable = true,
        viewNumber = true,
        viewString = true,
        viewStringMax = 1000
      },
      runtime = {
        version = 'Lua 5.4',
        path = {
          "?.lua",
          "?/init.lua",
          "?/?.lua",
          "/usr/share/5.4/?.lua",
          "/usr/share/lua/5.4/?/init.lua"
        }
      },
      signatureHelp = {
        enable = true
      },
      workspace = {
        maxPreload = 2000,
        preloadFileSize = 1000
      },
      telemetry = {
        enable = false
      }
    }
  }
}


