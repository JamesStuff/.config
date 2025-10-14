return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  lazy = true,
  cmd = { "ConformInfo", "ConformFormat" },
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({
          formatters = { "injected" },
          timeout_ms = 3000,
        })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
    {
      "<leader>cf",
      function()
        require("conform").format()
      end,
      mode = { "n", "v" },
      desc = "Format Buffer",
    },
  },
  opts = function()
    ---@type conform.setupOpts
    return {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- Example:
        -- shfmt = {
        --   prepend_args = { "-i", "2", "-ci" },
        -- },
      },
    }
  end,
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    -- Optional: Autoformat on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        conform.format({ bufnr = args.buf })
      end,
    })
  end,
}
