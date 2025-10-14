return  {
  "saghen/blink.cmp",
  version = "*",
  build = vim.g.lazyvim_blink_main and "cargo build --release",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "saghen/blink.compat",
      optional = true,
      opts = {},
      version = not vim.g.lazyvim_blink_main and "*",
    },
  },
  event = { "InsertEnter", "CmdlineEnter" },

  opts = {
    snippets = {
      expand = function(args)
        -- Use nvim-cmp's native snippet expansion
        -- local luasnip = require("luasnip")
        -- luasnip.lsp_expand(args.body)
      end,
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        draw = { treesitter = { "lsp" } },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = { enabled = vim.g.ai_cmp },
    },
    fuzzy = { implementation = "rust" },

    sources = {
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = {
      enabled = true,
      keymap = {
        preset = "cmdline",
        ["<Right>"] = false,
        ["<Left>"] = false,
      },
      completion = {
        list = { selection = { preselect = false } },
        menu = { auto_show = function() return vim.fn.getcmdtype() == ":" end },
        ghost_text = { enabled = true },
      },
    },

    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },
    },
  },

  config = function(_, opts)
    -- setup compat sources
    local enabled = opts.sources.default
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
        table.insert(enabled, source)
      end
    end

    -- Unset custom prop to pass blink.cmp validation
    opts.sources.compat = nil

    -- Setup blink.cmp
    require("blink.cmp").setup(opts)
  end,
}
