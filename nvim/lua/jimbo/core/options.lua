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

-- Colour line to force good habits
vim.opt.colorcolumn = { 80, 120 }

-- Default gutter width for line numbers
vim.opt.numberwidth = 3

-- -- Set cmdheight to 0 to hide the command line area when idle
-- vim.opt.cmdheight = 0
-- TODO: Have a look at noice.nvim...
local cmdheight_group = vim.api.nvim_create_augroup("CmdHeightAdjust", {})
vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = cmdheight_group,
    callback = function()
        vim.opt.cmdheight = 1
    end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = cmdheight_group,
    callback = function()
        vim.opt.cmdheight = 0
    end,
})
