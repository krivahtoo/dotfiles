-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    'bluz71/vim-nightfly-guicolors',
    config = function()
      require'krivah.nightfly'
    end
  }

  -- LSP plugins
  use {
    'neovim/nvim-lspconfig',
    requires = { 'ray-x/lsp_signature.nvim' },
    config = function()
      require'krivah.lsp'
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    after = 'nvim-lspconfig',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-git',
      'David-Kunz/cmp-npm',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-copilot'
    },
    config = function()
      require'krivah.cmp'
    end
  }
  use {
    'tami5/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require'krivah.lspsaga'
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
    config = function()
      vim.api.nvim_exec([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]], false)
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
  }
  use 'simrat39/symbols-outline.nvim'

  -- Snippets
  use {
    'hrsh7th/vim-vsnip',
    requires = {
      'hrsh7th/vim-vsnip-integ'
    }
  }
  use 'rafamadriz/friendly-snippets'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require'krivah.telescope'
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'p00f/nvim-ts-rainbow',
      'mfussenegger/nvim-ts-hint-textobject'
    },
    config = function()
      require'krivah.treesitter'
    end,
    run = ':TSUpdate'
  }
  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require"surround".setup {
        mappings_style = "sandwich",
        prefix = "<leader>s"
      }
    end
  }

  -- ui status lines
  use({
    'NTBBloodbath/galaxyline.nvim',
    after = 'vim-nightfly-guicolors',
    requires = {
      'nvim-lua/lsp-status.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require'krivah.galaxyline'
    end,
  })

  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'krivah.bufferline'
    end,
  }

  -- Terminal
  use {"akinsho/toggleterm.nvim"}

  -- File manager
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'krivah.tree'
    end
  }

  -- Comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
      require'krivah.comment'
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
    config = function()
      require'krivah.gitsigns'
    end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require'krivah.diffview'
    end
  }

  -- Zen Mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Other
  use 'yamatsum/nvim-cursorline'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require'krivah.indent'
    end
  }
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require'krivah.rest'
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
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      }
    end
  }
  use {
    'Saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require'krivah.crates'
    end,
  }
  use {
    'fhill2/xplr.nvim',
    run = function() require'xplr'.install({hide=true}) end,
    requires = {{'nvim-lua/plenary.nvim'}, {'MunifTanjim/nui.nvim'}}
  }
  use {
    'stevearc/dressing.nvim',
    config = function()
      require'krivah.dressing'
    end
  }
  use { 'mhartington/formatter.nvim' }
  use {
    'chentau/marks.nvim',
    config = function()
      require'krivah.marks'
    end
  }
  use {
    'CRAG666/code_runner.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require'code_runner'.setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'rcarriga/nvim-notify',
    before = 'telescope.nvim',
    config = function()
      require'krivah.notify'
    end
  }
  use 'github/copilot.vim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'ggandor/lightspeed.nvim'
  use 'kazhala/close-buffers.nvim'
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

