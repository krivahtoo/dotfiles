return require('packer').startup {
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use {
      -- my custom version of bluz71/vim-nightfly-guicolors
      '~/github/nightfly.nvim',
      config = function()
        vim.cmd [[colorscheme nightfly]]
      end,
    }

    -- LSP plugins
    use {
      'neovim/nvim-lspconfig',
      after = 'cmp-nvim-lsp',
      config = function()
        require 'krivah.lsp'
      end,
    }
    use {
      'tami5/lspsaga.nvim',
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
      after = 'nvim-lspconfig',
      config = function()
        require 'krivah.fidget'
      end,
    }
    use {
      'jose-elias-alvarez/null-ls.nvim',
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
          exact = -1, -- 2
          async = false,
          capacity = 5,
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
      event = 'InsertEnter',
      config = function()
        require 'krivah.luasnip'
      end,
    }
    use {
      'rafamadriz/friendly-snippets',
      event = 'InsertEnter',
    }
    use {
      'honza/vim-snippets',
      event = 'InsertEnter',
    }

    -- Fuzzy finders
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      module = 'telescope',
      keys = { '<leader>ff' },
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
        require 'krivah.telescope'
      end,
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'p00f/nvim-ts-rainbow',
        'windwp/nvim-ts-autotag',
        'SmiteshP/nvim-gps',
      },
      config = function()
        require 'krivah.treesitter'
      end,
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
        { 'x', 'm' },
        { 'o', 'n' },
      },
      config = function()
        require 'krivah.tsht'
      end,
    }

    -- ui status lines
    use {
      'NTBBloodbath/galaxyline.nvim',
      after = 'nightfly.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require 'krivah.galaxyline'
      end,
    }

    use {
      'akinsho/nvim-bufferline.lua',
      tag = 'v2.*',
      after = 'nightfly.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require 'krivah.bufferline'
      end,
    }

    -- Terminal
    use {
      'akinsho/toggleterm.nvim',
      tag = 'v1.*',
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
      'numToStr/Comment.nvim',
      keys = { 'gc', 'gb' },
      module = 'Comment',
      requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
      config = function()
        require 'krivah.comment'
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
      'folke/lua-dev.nvim',
      module = 'lua-dev',
    }

    -- Project
    use {
      'klen/nvim-config-local',
      config = function()
        require('config-local').setup {
          -- Default configuration (optional)
          config_files = { '.vimrc.lua', '.vimrc' }, -- Config file patterns to load (lua supported)
          hashfile = vim.fn.stdpath 'data' .. '/config-local', -- Where the plugin keeps files data
          autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
          commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
          silent = false, -- Disable plugin messages (Config loaded/ignored)
          lookup_parents = false, -- Lookup config files in parent directories
        }
      end,
    }
    use {
      'rmagatti/auto-session',
      config = function()
        require('auto-session').setup {
          log_level = 'info',
          auto_session_suppress_dirs = {
            '~/',
            '~/Projects',
            '~/github',
            '~/Playground',
          },
          auto_session_use_git_branch = true,
        }
      end,
    }

    -- Motion
    use {
      'phaazon/hop.nvim',
      -- branch = 'v1', -- optional but strongly recommended
      keys = { '<leader>e', '<leader>E', 's', 'S' },
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
      after = 'nightfly.nvim',
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
      config = function()
        require 'krivah.notify'
      end,
    }
    use {
      'baskerville/vim-sxhkdrc',
      event = { 'BufRead sxhkdrc' },
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
      'AckslD/nvim-trevJ.lua',
      keys = { { 'n', '<leader>j' } },
      config = function()
        require('trevj').setup()
        vim.keymap.set('n', '<leader>j', function()
          require('trevj').format_at_cursor()
        end)
      end,
    }
    use {
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn['mkdp#util#install']()
      end,
      cmd = 'MarkdownPreview*',
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
      '~/github/fzf-tmux.nvim',
      config = function()
        require 'krivah.fzf-tmux'
      end,
    }
    use {
      '~/github/silicon.nvim',
      run = './install.sh',
      cmd = 'Silicon',
      module = 'silicon',
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
