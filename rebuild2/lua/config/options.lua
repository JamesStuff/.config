local opt = vim.opt
local keymap = vim.keymap

-- Line Numbering
opt.relativenumber = true
opt.number = true

-- Tabs and Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- Default gutter width for line numbers
opt.numberwidth = 3

-- Search Settings
opt.ignorecase = true
opt.smartcase = true


-- Colours
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Colour line to force good habits
opt.colorcolumn = { 80, 120 }

-- Splitting Windows
opt.splitright = true
opt.splitbelow = true

-- Spelling
opt.spelllang = "en_gb"
opt.spell = true

-- Stops `o` from adding a comment
opt.formatoptions:remove("o")

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

-- TODO: Fix...
-- Suppress file write message
opt.shortmess:append("F")

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window


keymap.set("n", "<Up>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("n", "<Down>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("n", "<Left>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("n", "<Right>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })

-- ...
-- We have the same for all modes

keymap.set("n", "<leader>z", "1z=", { desc = "Spelling: Apply first suggestion" }) -- split window vertically


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


