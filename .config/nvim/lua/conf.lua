-- leader key
vim.g.mapleader = " "

-- opt looks good
local opt = vim.opt

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- search settings
opt.cursorline = true

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
