return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- keymaps
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
  end,
}
