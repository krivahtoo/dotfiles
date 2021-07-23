set encoding=utf8

set guifont=FiraCode\ Nerd\ Font:h11

" Make sure numbering is set
set number
set relativenumber

" Enable mouse support
set mouse=a

" Disable Swap file
set nobackup
set noswapfile

" More natural splitting
set splitbelow
set splitright

" Enable syntax highlighting
syntax enable

set termguicolors

" Ignore annoying patterns
set wildignore=*.pyc,**/__pycache__/*,**/node_modules/*,.coverage.*,.eggs,*.egg-info/

" Ignore casing when performing completion
set wildignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=4

" Linebreak on 500 characters
set lbr
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set termguicolors " this variable must be enabled for colors to be applied properly

call plug#begin()

    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'

    Plug 'kabouzeid/nvim-lspinstall'

    Plug 'bluz71/vim-nightfly-guicolors'

    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    Plug 'akinsho/nvim-bufferline.lua'

    Plug 'yamatsum/nvim-cursorline'

    Plug 'tpope/vim-surround'

    Plug 'tveskag/nvim-blame-line'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'folke/tokyonight.nvim'

    Plug 'nvim-lua/lsp-status.nvim'

    Plug 'kosayoda/nvim-lightbulb'

    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'lambdalisue/nerdfont.vim'

    Plug 'sindrets/diffview.nvim'

    Plug 'lambdalisue/glyph-palette.vim'

    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'folke/lsp-colors.nvim'

    Plug 'b3nj5m1n/kommentary'

" Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'folke/todo-comments.nvim'

    Plug 'donRaphaco/neotex', { 'for': 'tex' }

    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'


    Plug 'folke/trouble.nvim'

    Plug 'hrsh7th/nvim-compe'

    Plug 'onsails/lspkind-nvim'

    Plug 'airblade/vim-gitgutter'

    Plug 'simrat39/symbols-outline.nvim'

    Plug 'kovetskiy/sxhkd-vim'

    Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

" colorscheme tokyonight
colorscheme nightfly

"""""""""""""""""""""""""""""""""""""""""""
" => Globals
"""""""""""""""""""""""""""""""""""""""""""
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 20 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

let g:symbols_outline = {
    \ "highlight_hovered_item": v:true,
    \ "show_guides": v:true,
    \ "position": 'right',
    \ "auto_preview": v:false,
    \ "keymaps": {
        \ "close": "<Esc>",
        \ "goto_location": "<Cr>",
        \ "focus_location": "o",
        \ "hover_symbol": "<C-space>",
        \ "rename_symbol": "r",
        \ "code_actions": "a",
    \ },
    \ "lsp_blacklist": [],
\ }

let g:neovide_cursor_vfx_mode = "ripple"


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lua Setups
" TODO: Move to a lua file
""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
require("bufferline").setup{
  options = {
    numbers = "none" ,
    number_style = "", -- buffer_id at index 1, ordinal at index 2
    mappings = true,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "relative_directory"
  }
}

require("colorizer").setup()

require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section
}

local lsp_status = require('lsp-status')
lsp_status.register_progress()

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- setup language servers
require'lspconfig'.svelte.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.elixirls.setup{
    cmd = { "/home/krivah/Applications/elixir-ls/language_server.sh" };
}
require'lspconfig'.cmake.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.vuels.setup{}
--require'lspconfig'.rls.setup{}
require'lspconfig'.rust_analyzer.setup{}


require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      --["foo.bar"] = "Identifier",
    },
  },
}

require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = '',
      Operator = 'ﰃ'
    },
})
require('statusline')
EOF

""""""""""""""""""""""""""""""""""
" => autocmds 
""""""""""""""""""""""""""""""""""

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
autocmd BufEnter * EnableBlameLine

"""""""""""""""""""""""""""""""""""""""""""""""""

sign define LspDiagnosticsSignError text=  texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=𥉉 texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=  texthl=LspDiagnosticsSignHint linehl= numhl=




""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><mymap> :BufferLineMoveNext<CR>
nnoremap <silent><mymap> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" NvimTree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>TodoTelescope<cr>

" Show Trouble
nnoremap <leader>tt <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>tc <cmd>TodoTrouble<cr>

" Cycle current buffers
nnoremap <leader>bn <cmd>BufferLineCycleNext<cr>
nnoremap <leader>bp <cmd>BufferLineCyclePrev<cr>

" Lspsaga
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" Code actions
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" jump diagnostic
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" floating terminal
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

