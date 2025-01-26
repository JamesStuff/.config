-- Lua mappings for tmux navigation in Neovim
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-H>", "<cmd>TmuxNavigateLeft<cr>", opts)
vim.keymap.set("n", "<C-J>", "<cmd>TmuxNavigateDown<cr>", opts)
vim.keymap.set("n", "<C-K>", "<cmd>TmuxNavigateUp<cr>", opts)
vim.keymap.set("n", "<C-L>", "<cmd>TmuxNavigateRight<cr>", opts)
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", opts)
