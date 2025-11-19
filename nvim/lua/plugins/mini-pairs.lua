return {
  "echasnovski/mini.pairs",
  event = "VeryLazy", -- lazy-load on a common event
  config = function()
    require("mini.pairs").setup()
  end,
}

