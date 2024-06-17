-- leader key
vim.g.mapleader = " "

-- opt looks good
local opt = vim.opt
local key = vim.keymap

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- status line
opt.laststatus = 0

-- colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- numbers
opt.relativenumber = true
opt.number = true

-- swapfile
opt.swapfile = true

-- search highlight
opt.hlsearch = false

-- spell checking
opt.spell = true
opt.spelllang = "en_us"

-- wrap lines
key.set("n", "j", "gj")
key.set("n", "k", "gk")

-- neotree
key.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
