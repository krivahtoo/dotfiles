-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    'bluz71/vim-nightfly-guicolors',
    config = function()
      require 'krivah.nightfly'
    end
  }

  -- LSP plugins
  use {
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    config = function()
      require 'krivah.lsp'
    end
  }
  use {
    'tami5/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require 'krivah.lspsaga'
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'folke/lsp-colors.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
      })
    end
  }
  use {
    'kosayoda/nvim-lightbulb',
    event = 'LspAttach',
    config = function()
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        pattern = "*",
        callback = require 'nvim-lightbulb'.update_lightbulb
      })
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
    event = 'LspAttach',
    config = function()
      require 'krivah.lsp_signature'
    end
  }
  use {
    'j-hui/fidget.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require 'krivah.fidget'
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    after = 'LuaSnip',
    config = function()
      require 'krivah.cmp'
    end
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
      require('cmp-npm').setup({})
    end
  }
  use {
    'hrsh7th/cmp-cmdline',
    after = 'nvim-cmp',
  }
  use {
    'uga-rosa/cmp-dictionary',
    after = 'nvim-cmp',
    config = function()
      require("cmp_dictionary").setup({
        dic = {
          ["*"] = "/usr/share/dict/words",
        },
        -- The following are default values, so you don't need to write them if you don't want to change them
        exact = -1, -- 2
        async = false,
        capacity = 5,
        debug = false,
      })
    end
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
    after = 'nvim-cmp',
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
    end
  }
  use {
    'rafamadriz/friendly-snippets',
    event = 'InsertEnter'
  }
  use {
    'honza/vim-snippets',
    event = 'InsertEnter'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require 'krivah.telescope'
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      -- 'nvim-treesitter/nvim-treesitter-context',
      'p00f/nvim-ts-rainbow',
      'mfussenegger/nvim-ts-hint-textobject',
      'windwp/nvim-ts-autotag',
      'SmiteshP/nvim-gps'
    },
    config = function()
      require 'krivah.treesitter'
    end,
    run = ':TSUpdate'
  }

  -- ui status lines
  use({
    'NTBBloodbath/galaxyline.nvim',
    after = 'vim-nightfly-guicolors',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require 'krivah.galaxyline'
    end,
  })

  use {
    'akinsho/nvim-bufferline.lua',
    tag = "v2.*",
    after = 'vim-nightfly-guicolors',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'krivah.bufferline'
    end,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*',
    config = function()
      require("toggleterm").setup()
    end
  }

  -- File manager
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'krivah.tree'
    end
  }

  -- Comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }
  use {
    'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
      require 'krivah.comment'
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    cond = require('utils').is_git_repo,
    config = function()
      require 'krivah.gitsigns'
    end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    cond = require('utils').is_git_repo,
    config = function()
      require 'krivah.diffview'
    end
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    cond = require('utils').is_git_repo,
    config = function()
      require 'krivah.neogit'
    end
  }

  -- Zen Mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end
  }

  -- Debugging
  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {
      'mfussenegger/nvim-dap'
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }

  -- Project
  use {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        -- Default configuration (optional)
        config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = false, -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false, -- Lookup config files in parent directories
      }
    end
  }
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/', '~/Projects' }
      }
    end
  }

  -- Motion
  use 'ggandor/lightspeed.nvim'
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
    config = function()
      if vim.g.nvui then
        vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
      else
        vim.g.fzf_layout = { tmux = '-p90%,70%' }
      end
      vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, fzf#vim#with_preview(), <bang>0)')
    end
  }
  use {
    'booperlv/nvim-gomove',
    config = function()
      require('gomove').setup {
        -- whether or not to map default key bindings, (true/false)
        map_defaults = false,
      }
    end
  }

  -- Other
  use {
    'xiyaowong/nvim-cursorword',
    after = 'vim-nightfly-guicolors'
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'krivah.indent'
    end
  }
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      -- require'krivah.rest'
    end
  }
  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    },
    config = function()
      require('krivah.searchbox')
    end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use {
    'Saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require 'krivah.crates'
    end,
  }
  use {
    'stevearc/dressing.nvim',
    after = 'telescope.nvim',
    config = function()
      require 'krivah.dressing'
    end
  }
  use {
    'chentoast/marks.nvim',
    config = function()
      require 'krivah.marks'
    end
  }
  use {
    'michaelb/sniprun',
    run = 'bash ./install.sh',
    config = function()
      require 'krivah.sniprun'
    end
  }
  use {
    'rcarriga/nvim-notify',
    before = 'telescope.nvim',
    config = function()
      require 'krivah.notify'
    end
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require 'krivah/null-ls'
    end
  }
  use {
    'baskerville/vim-sxhkdrc',
    disable = true
  }
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
} })
