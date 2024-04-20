return {
  { -- the beginners' must have
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end
  },

  -- C-w hjkl or this
  "christoomey/vim-tmux-navigator",

  -- comments
  "preservim/nerdcommenter",

  { -- netrw replacer
    "nvim-neo-tree/neo-tree.nvim",
  },

  { -- nice theme
    "catppuccin/nvim",
    priority = 1000,
    init = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end
  },

  { -- idk what it's doing, delete in future
    "stevearc/dressing.nvim",
    event = "VeryLazy"
  },

  { -- must have esp for web development
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "┊" },
    }
  },

  { -- something about closing brackets, check its docs
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  }
}
