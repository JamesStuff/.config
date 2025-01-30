-- Lua mappings for tmux navigation in Neovim
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-S-H>", "<cmd>TmuxNavigateLeft<cr>", opts)
vim.keymap.set("n", "<C-S-J>", "<cmd>TmuxNavigateDown<cr>", opts)
vim.keymap.set("n", "<C-S-K>", "<cmd>TmuxNavigateUp<cr>", opts)
vim.keymap.set("n", "<C-S-L>", "<cmd>TmuxNavigateRight<cr>", opts)
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", opts)
