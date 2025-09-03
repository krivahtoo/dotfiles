return require('packer').startup {
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color Theme
    use {
      'bluz71/vim-nightfly-guicolors',
      -- my custom version of bluz71/vim-nightfly-guicolors
      -- '~/github/nightfly.nvim',
      config = function()
        require 'krivah.nightfly'
      end,
    }
    use 'navarasu/onedark.nvim'

    -- LSP plugins
    use {
      'neovim/nvim-lspconfig',
      after = 'cmp-nvim-lsp',
      config = function()
        require 'krivah.lsp'
      end,
    }
    use {
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require 'krivah.lspsaga'
      end,
    }
    use {
      'folke/trouble.nvim',
      cmd = 'Trouble',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
       require('trouble').setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end,
    }
    use {
      'kosayoda/nvim-lightbulb',
      after = 'nvim-lspconfig',
      config = function()
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          pattern = '*',
          callback = require('nvim-lightbulb').update_lightbulb,
          desc = 'Lightbulb autocommand',
        })
      end,
    }
    use {
      'ray-x/lsp_signature.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require 'krivah.lsp_signature'
      end,
    }
    use {
      'j-hui/fidget.nvim',
      branch = 'legacy',
      after = 'nvim-lspconfig',
      config = function()
        require 'krivah.fidget'
      end,
    }
    use {
      'nvimtools/none-ls.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require 'krivah.null-ls'
      end,
    }

    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      after = 'LuaSnip',
      config = function()
        require 'krivah.cmp'
      end,
    }
    use {
      'hrsh7th/cmp-nvim-lsp',
      after = 'nvim-cmp',
    }
    use {
      'hrsh7th/cmp-path',
      after = 'nvim-cmp',
    }
    use {
      'hrsh7th/cmp-buffer',
      after = 'nvim-cmp',
    }
    use {
      'hrsh7th/cmp-git',
      after = 'nvim-cmp',
    }
    use {
      'hrsh7th/cmp-calc',
      after = 'nvim-cmp',
    }
    use {
      'hrsh7th/cmp-emoji',
      after = 'nvim-cmp',
    }
    use {
      'David-Kunz/cmp-npm',
      after = 'nvim-cmp',
      config = function()
        require('cmp-npm').setup {}
      end,
    }
    use {
      'hrsh7th/cmp-cmdline',
      after = 'nvim-cmp',
    }
    use {
      'uga-rosa/cmp-dictionary',
      after = 'nvim-cmp',
      config = function()
        require('cmp_dictionary').setup {
          dic = {
            ['*'] = '/usr/share/dict/words',
          },
          exact_length = 2,
          async = false,
          debug = false,
        }
      end,
    }
    use {
      'f3fora/cmp-spell',
      after = 'nvim-cmp',
    }
    use {
      'lukas-reineke/cmp-rg',
      after = 'nvim-cmp',
    }
    use {
      'lukas-reineke/cmp-under-comparator',
      module = 'cmp-under-comparator',
    }
    use {
      'saadparwaiz1/cmp_luasnip',
      after = 'nvim-cmp',
    }
    use {
      'hrsh7th/cmp-nvim-lua',
      after = 'nvim-cmp',
    }
    use {
      'ray-x/cmp-treesitter',
      after = 'nvim-cmp',
    }
    use {
      'dmitmel/cmp-digraphs',
      after = 'nvim-cmp',
    }

    -- Snippets
    use {
      'L3MON4D3/LuaSnip',
      after = 'friendly-snippets',
      config = function()
        require 'krivah.luasnip'
      end,
    }
    use {
      'rafamadriz/friendly-snippets',
      after = 'vim-snippets',
    }
    use {
      'honza/vim-snippets',
      event = 'BufEnter',
    }

    -- Fuzzy finders
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      module = 'telescope',
      -- keys = { '<leader>ff' },
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
        require 'krivah.telescope'
      end,
    }
    use {
      "ibhagwan/fzf-lua",
      cmd = 'FzfLua',
      module = 'fzf-lua',
      -- optional for icon support
      requires = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require 'krivah.fzf-lua'
      end,
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'hiphish/rainbow-delimiters.nvim',
        'windwp/nvim-ts-autotag',
        -- 'SmiteshP/nvim-gps',
      },
      config = function()
        require 'krivah.treesitter'
      end,
      -- branch = 'main',
      run = ':TSUpdate',
    }
    use {
      'nvim-treesitter/playground',
      cmd = {
        'TSPlaygroundToggle',
        'TSHighlightCapturesUnderCursor',
        'TSNodeUnderCursor',
      },
    }
    use {
      'mizlan/iswap.nvim',
      cmd = 'ISwap',
    }
    use {
      'mfussenegger/nvim-ts-hint-textobject',
      module = 'tsht',
      keys = {
        { 'n', '<leader>m' },
        { 'x', 'in' },
        { 'o', 'in' },
      },
      config = function()
        require 'krivah.tsht'
      end,
    }

    -- ui status lines
    use {
      'rebelot/heirline.nvim',
      event = "UiEnter",
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require 'krivah.heirline'
      end,
    }

    use {
      'akinsho/nvim-bufferline.lua',
      tag = 'v4.*',
      -- after = 'nightfly.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require 'krivah.bufferline'
      end,
    }

    -- Terminal
    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      keys = { '<leader>tt', '<leader>tf' },
      config = function()
        require 'krivah.toggleterm'
      end,
    }

    -- File manager
    use {
      'kyazdani42/nvim-tree.lua',
      keys = { '<C-n>', '<leader>n' },
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require 'krivah.tree'
      end,
    }

    -- Comments
    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      event = { 'BufRead' },
      config = function()
        require('todo-comments').setup {}
      end,
    }
    use {
      'JoosepAlviste/nvim-ts-context-commentstring',
      module = 'ts_context_commentstring'
    }
    -- builtin in v0.10
    use {
      'numToStr/Comment.nvim',
      -- keys = { 'gc', 'gb' },
      module = 'Comment',
      requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
      config = function()
        -- require 'krivah.comment'
      end,
    }

    -- Git
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
      },
      cond = require('utils').is_git_repo,
      event = 'BufEnter',
      config = function()
        require 'krivah.gitsigns'
      end,
    }
    use {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
      cond = require('utils').is_git_repo,
      cmd = 'Diffview*',
      config = function()
        require 'krivah.diffview'
      end,
    }
    use {
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim',
      cond = require('utils').is_git_repo,
      cmd = 'Neogit',
      config = function()
        require 'krivah.neogit'
      end,
    }
    use {
      'tanvirtin/vgit.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
      },
      cmd = 'VGit',
      config = function()
        require('vgit').setup()
      end,
    }

    -- Zen Mode
    use {
      'folke/zen-mode.nvim',
      cmd = 'ZenMode',
      config = function()
        require 'krivah.zen-mode'
      end,
    }
    use {
      'folke/twilight.nvim',
      module = 'twilight',
      config = function()
        require('twilight').setup {}
      end,
    }

    -- Debugging
    use {
      'mfussenegger/nvim-dap',
      module = 'dap',
      cmd = 'Dap*',
    }
    use {
      'theHamsta/nvim-dap-virtual-text',
      requires = {
        'mfussenegger/nvim-dap',
      },
      after = 'nvim-dap',
      config = function()
        require('nvim-dap-virtual-text').setup()
      end,
    }

    -- neovim lua dev
    use {
      'folke/neodev.nvim',
      module = 'neodev',
    }

    -- Project
    use {
      'rmagatti/auto-session',
      config = function()
        require('auto-session').setup {
          log_level = 'warn',
          auto_session_suppress_dirs = {
            '~/',
            '~/Projects',
            '~/github',
            '~/Playground',
          },
          auto_session_use_git_branch = true,
          auto_session_create_enabled = false,
          auto_save_enabled = true,
        }
      end,
    }

    -- Motion
    use {
      'smoka7/hop.nvim',
      -- branch = 'v1', -- optional but strongly recommended
      keys = {
        { 'n', '<leader>e' },
        { 'n', '<leader>E' },
        { 'n', 's' },
        { 'n', 'S' },
        { 'x', 's' },
        { 'x', 'S' },
      },
      module = 'hop',
      config = function()
        require 'krivah.hop'
      end,
    }
    use {
      'booperlv/nvim-gomove',
      keys = {
        { 'x', '<C-Right>' },
        { 'x', '<C-Left>' },
        { 'x', '<C-Up>' },
        { 'x', '<C-Down>' },
      },
      config = function()
        require 'krivah.gomove'
      end,
    }

    -- Other
    use {
      'xiyaowong/nvim-cursorword',
      -- after = 'nightfly.nvim',
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require 'krivah.indent'
      end,
    }
    use {
      'NTBBloodbath/rest.nvim',
      event = { 'BufRead *.http' },
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require 'krivah.rest'
      end,
    }
    use {
      'VonHeikemen/searchbox.nvim',
      keys = { '<leader>ss', '<leader>sS' },
      requires = {
        { 'MunifTanjim/nui.nvim' },
      },
      config = function()
        require 'krivah.searchbox'
      end,
    }
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end,
    }
    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup {}
      end,
    }
    use {
      'Saecki/crates.nvim',
      event = { 'BufRead Cargo.toml' },
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
        require 'krivah.crates'
      end,
    }
    use {
      'stevearc/dressing.nvim',
      after = 'vim-nightfly-guicolors',
      config = function()
        require 'krivah.dressing'
      end,
    }
    use {
      'ziontee113/icon-picker.nvim',
      cmd = 'Pick*',
      -- key = {
      --   { 'i', '<C-i>' },
      --   { 'n', '<leader>ii' },
      -- },
      config = function()
        require 'icon-picker'
      end,
    }
    use {
      'chentoast/marks.nvim',
      keys = {
        { 'n', 'm' },
        { 'n', 'dm' },
        { 'n', "'" },
      },
      module = 'marks',
      config = function()
        require 'krivah.marks'
      end,
    }
    use {
      'michaelb/sniprun',
      run = 'bash ./install.sh',
      cmd = 'Snip*',
      config = function()
        require 'krivah.sniprun'
      end,
    }
    use {
      'rcarriga/nvim-notify',
      after = 'vim-nightfly-guicolors',
      config = function()
        require 'krivah.notify'
      end,
    }
    use {
      'baskerville/vim-sxhkdrc',
      event = { 'BufRead sxhkdrc' },
    }
    use {
      'kaarmu/typst.vim',
      event = { 'BufRead *.typ' },
    }

    use {
      'antoinemadec/FixCursorHold.nvim',
      event = { 'BufRead', 'BufNewFile' },
    }
    use {
      'neomutt/neomutt.vim',
      event = { 'BufRead *muttrc' },
    }
    use {
      'famiu/bufdelete.nvim',
      cmd = { 'Bdelete', 'Bwipeout' },
    }
    use {
      'elihunter173/dirbuf.nvim',
      cmd = 'Dirbuf*',
    }
    use {
      'stevearc/oil.nvim',
      keys = {
        { 'n', '<leader>o' },
      },
      config = function()
        require 'krivah.oil'
      end,
    }
    use {
      'kyazdani42/nvim-web-devicons',
      module = 'nvim-web-devicons',
    }
    use {
      'MunifTanjim/nui.nvim',
      module = 'nui',
    }
    use {
      'ThePrimeagen/refactoring.nvim',
      module = 'refactoring',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-treesitter/nvim-treesitter' },
      },
      config = function()
        require('refactoring').setup {}
      end,
    }
    use {
      'Wansmer/treesj',
      keys = {
        { 'n', '<space>m' },
        { 'n', '<space>j' },
        { 'n', '<space>s' },
      },
      requires = { 'nvim-treesitter' },
      config = function()
        require('treesj').setup {}
      end,
    }

    use {
      'onsails/diaglist.nvim',
      module = 'diaglist',
    }

    use {
      'stevearc/stickybuf.nvim',
      config = function()
        require('stickybuf').setup()
      end,
    }

    use {
      'tiagovla/scope.nvim',
      config = function()
        require('scope').setup()
      end,
    }

    use {
      'folke/noice.nvim',
      cmd = 'Noice',
      config = function()
        require('noice').setup()
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
      },
    }
    use {
      'debugloop/telescope-undo.nvim',
      keys = {
        { 'n', '<leader>u' }
      },
      requires = { 'nvim-telescope/telescope.nvim' },
      config = function()
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
      end,
    }

    use {
      'tommcdo/vim-exchange',
      keys = {
        { 'n', 'cx' }
      },
    }

    use {
      'andweeb/presence.nvim',
      config = function()
        require("presence").setup({
          -- General options
          auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
          main_image          = "file",                   -- Main image display (either "neovim" or "file")
          log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
          debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
          enable_line_number  = true,                      -- Displays the current line number instead of the current project
          blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
          buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
          file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
          show_time           = true,                       -- Show the timer

          -- Rich Presence text options
          editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
          file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
          git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
          plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
          reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
          workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
          line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        })
      end
    }

    use {
      'kylechui/nvim-surround',
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
    }

    use {
      'jcdickinson/codeium.nvim',
      after = 'nvim-cmp',
      requires = {
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp',
      },
      config = function()
        require('codeium').setup {}
      end,
    }

    use {
      'luckasRanarison/tailwind-tools.nvim',
      requires = {
        'nvim-treesitter/nvim-treesitter'
      },
      cmd = 'Tailwind*',
      config = function()
        require("tailwind-tools").setup {
          document_color = {
            enabled = true, -- can be toggled by commands
            kind = "inline", -- "inline" | "foreground" | "background"
            inline_symbol = "󰝤 ", -- only used in inline mode
            debounce = 200, -- in milliseconds, only applied in insert mode
          },
          conceal = {
            enabled = false, -- can be toggled by commands
            min_length = 30, -- only conceal classes exceeding the provided length
            symbol = "󱏿 ", -- only a single character is allowed
            highlight = { -- extmark highlight options, see :h 'highlight'
              fg = "#38BDF8",
            },
          },
          custom_filetypes = {} -- see the extension section to learn how it works
        }
      end
    }

    use {
      '~/github/fzf-tmux.nvim',
      cond = function()
        return not vim.g.neovide
      end,
      config = function()
        require 'krivah.fzf-tmux'
      end,
    }
    use {
      '~/github/silicon.nvim',
      run = './install.sh build',
      -- cmd = 'Silicon',
      -- module = 'silicon',
      config = function()
        require 'krivah.silicon'
      end,
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}
