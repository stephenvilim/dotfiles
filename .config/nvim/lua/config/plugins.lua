require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("config.plugins.tokyonight")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.plugins.nvim_tree")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("config.plugins.bufferline")
    end
  },
  {
    "levouh/tint.nvim",
    config = function()
      require("config.plugins.tint")
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.plugins.telescope")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.plugins.cmp")
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("config.plugins.luasnip")
    end
  },
  {
    "saadparwaiz1/cmp_luasnip"
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help"
  },
  {
    "hrsh7th/cmp-cmdline"
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.plugins.treesitter")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context"
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("config.plugins.ufo")
    end
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("config.plugins.neodev")
    end
  },
  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require("config.plugins.hop")
    end
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.plugins.lualine")
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      }
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("config.plugins.comment")
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.plugins.indent_blankline")
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup({})
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("config.plugins.treesitter_textobjects")
    end
  },
  {
    "sindrets/winshift.nvim",
    config = function()
      require("winshift").setup({})
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("config.plugins.symbols-outline")
    end
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = { useDefaultKeymaps = true },
  },
  {
    "https://github.com/chrisgrieser/nvim-spider"
  },
  {
    "Bekaboo/dropbar.nvim"
  },
  {
    "antosha417/nvim-lsp-file-operations"
  },
  {
    "SmiteshP/nvim-navbuddy"
  },
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("config.plugins.noice")
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      hightlight = {
        multiline = false
      }
    }
  },
  {
    "vimwiki/vimwiki"
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    "ggandor/leap-spooky.nvim",
    config = function()
      require('leap-spooky').setup {
      }
    end
  },
  {
    "ggandor/leap-ast.nvim",
    config = function()
      require('leap-spooky').setup {
        --vim.keymap.set({ 'n', 'x', 'o' }, 'a', function() require 'leap-ast'.leap() end, {})
      }
    end
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  {
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup({
      })
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {}
  }

  --[[
    {
        "voldikss/vim-floaterm"
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
        "https://github.com/machakann/vim-sandwich"
    },
    {
        "rcarriga/nvim-notify"
    },
    {
        "liuchengxu/vista.vim"
    },
    {
        "simnalamburt/vim-mundo"
    },
    {
        "glacambre/firenvim"
    },
    {
        "kevinhwang91/nvim-bqf"
    },
    {
        "gelguy/wilder.nvim"
    },
    {
        "skywind3000/asyncrun.vim"
    }
    https://github.com/wimstefan/dotfiles/blob/master/config/nvim/lua/plugins/treesitter.lua
    tpope/vim-unimpaired
    https://github.com/ThePrimeagen/refactoring.nvim
    nvim-treesitter/nvim-treesitter-context
    https://github.com/RRethy/nvim-treesitter-textsubjects
    https://github.com/AstroNvim/AstroNvim
	simrat39/symbols-outline.nvim
  https://github.com/kiyoon/dotfiles
  mizlan/iswap.nvim
  ggandor/leap.nvim
  https://github.com/rmagatti/auto-session
  https://github.com/echasnovski/mini.nvim
  chrisgrieser/nvim-spider
  chrisgrieser/nvim-various-textobjs
  ziontee113/syntax-tree-surfer
  drybalka/tree-climber.nvim
  folke/flash.nvim
  folke/noice.nvim
  folke/trouble.nvim
  mfussenegger/nvim-treehopper
  willothy/flatten.nvim
  zbirenbaum/neodim
  https://github.com/CRAG666/code_runner.nvim
  yamatsum/nvim-cursorline
  gbprod/substitute.nvim
  https://github.com/svermeulen/vim-yoink
  CKolkey/ts-node-action
  jubnzv/virtual-types.nvim
  j-hui/fidget.nvim
  kevinhwang91/nvim-bqf
  https://github.com/michaelb/sniprun
  https://github.com/stevearc/dressing.nvim
  https://neovimcraft.com/plugin/rktjmp/lush.nvim/index.html
  https://github.com/ray-x/navigator.lua
  https://github.com/onsails/lspkind.nvim
  https://github.com/MunifTanjim/nui.nvim
  https://github.com/ahmedkhalf/project.nvim
  https://github.com/folke/twilight.nvim
  https://github.com/pocco81/true-zen.nvim
  https://github.com/Vigemus/iron.nvim
  https://github.com/Wansmer/treesj
  https://github.com/akinsho/git-conflict.nvim
  https://github.com/rmagatti/goto-preview
  https://github.com/chentoast/marks.nvim
  https://github.com/tversteeg/registers.nvim
  https://github.com/nvim-focus/focus.nvim
  https://github.com/gbprod/yanky.nvim
  https://github.com/DNLHC/glance.nvim_
  https://github.com/b0o/incline.nvim
  RishabhRD/nvim-lsputils
  https://github.com/anuvyklack/windows.nvim
  https://github.com/ThePrimeagen/harpoon
  https://neovimcraft.com/plugin/akinsho/nvim-toggleterm.lua
  https://github.com/echasnovski/mini.nvim
  https://github.com/sindrets/diffview.nvim
  https://github.com/NeogitOrg/neogit
  https://github.com/jackMort/ChatGPT.nvim
  https://github.com/rcarriga/nvim-notify
  https://github.com/folke/todo-comments.nvim
  https://github.com/kylechui/nvim-surround
  https://github.com/ThePrimeagen/refactoring.nvim
  https://github.com/RRethy/vim-illuminate
  https://github.com/rcarriga/nvim-dap-ui
  https://github.com/ray-x/lsp_signature.nvim
  "https://github.com/lewis6991/gitsigns.nvim"
  https://github.com/lewis6991/gitsigns.nvim
  https://github.com/wellle/targets.vim
  https://github.com/RRethy/nvim-treesitter-textsubjects
  https://github.com/SmiteshP/nvim-navbuddy
  https://github.com/SmiteshP/nvim-navic
  https://github.com/nvim-treesitter/playground
  sheerun/vim-polyglot
  https://github.com/wellle/targets.vim
    ]]
})
