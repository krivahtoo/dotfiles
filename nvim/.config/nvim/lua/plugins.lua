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
    requires = {
      'ray-x/lsp_signature.nvim',
    },
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
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'David-Kunz/cmp-npm',
      'hrsh7th/cmp-cmdline',
      'uga-rosa/cmp-dictionary',
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
      vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"},{
        pattern = "*",
        callback = require'nvim-lightbulb'.update_lightbulb
      })
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
  }
  use {
    'j-hui/fidget.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require'krivah.fidget'
    end
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require'krivah.luasnip'
    end
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use 'rafamadriz/friendly-snippets'
  use 'honza/vim-snippets'

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
      'mfussenegger/nvim-ts-hint-textobject',
      'windwp/nvim-ts-autotag'
    },
    config = function()
      require'krivah.treesitter'
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
      require'krivah.galaxyline'
    end,
  })

  use {
    'akinsho/nvim-bufferline.lua',
    tag = "v2.*",
    after = 'vim-nightfly-guicolors',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'krivah.bufferline'
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
      -- require'krivah.diffview'
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
    'shaeinst/penvim',
    config = function()
      require("penvim").setup({
        project_env = {
          enable = true,
          config_name = '.__nvim__.lua'
        },
        rooter = {
          enable = true,
          patterns = {'.__nvim__.lua', '.git', 'node_modules', '.sln', '.svn'}
        },
      })
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

  -- Motion
  use 'ggandor/lightspeed.nvim'
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
    config = function()
      vim.g.fzf_layout = { tmux = '-p90%,60%' }
      vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, fzf#vim#with_preview(), <bang>0)')
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
      require'krivah.indent'
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
      {'MunifTanjim/nui.nvim'}
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
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'Saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      -- require'krivah.crates'
    end,
  }
  use {
    'stevearc/dressing.nvim',
    after = 'telescope.nvim',
    config = function()
      require'krivah.dressing'
    end
  }
  -- use { 'mhartington/formatter.nvim' }
  use {
    'chentoast/marks.nvim',
    config = function()
      require'krivah.marks'
    end
  }
  use {
    'michaelb/sniprun',
    run = 'bash ./install.sh',
    config = function()
      require'krivah.sniprun'
    end
  }
  use {
    'rcarriga/nvim-notify',
    before = 'telescope.nvim',
    config = function()
      require'krivah.notify'
    end
  }
  use {
    'github/copilot.vim',
    config = function()
      vim.cmd [[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
      vim.cmd [[let g:copilot_no_tab_map = v:true]]
    end
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require'krivah/null-ls'
    end
  }
  -- use 'kazhala/close-buffers.nvim'
  -- use 'baskerville/vim-sxhkdrc'
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

