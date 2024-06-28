vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- Tabs and Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- Colours
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard:append("unnamedplus") -- Uses system clipboard

-- Splitting Windows
opt.splitright = true
opt.splitbelow = true

-- Colour line to force good habbits
vim.opt.colorcolumn = { 80, 120 }
