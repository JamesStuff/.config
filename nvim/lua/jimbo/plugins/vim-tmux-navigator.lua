return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-H>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<C-J>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<C-K>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<C-L>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
