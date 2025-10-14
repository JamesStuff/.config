return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      local function setup_server(server)
        local custom_config_path = vim.fn.stdpath("config") .. "/lua/lsp/" .. server .. ".lua"
        if vim.loop.fs_stat(custom_config_path) then
          -- load custom config file (e.g. lua/lsp/lua_ls.lua)
          require("lsp." .. server)
        else
          -- use default server config
          vim.lsp.config(server, {})
        end
      end

      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
        },
        automatic_installation = true,
        automatic_enable = true, -- Mason will auto-enable the LSPs
        handlers = {
          function(server)
            setup_server(server)
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Global LSP defaults
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local buf = ev.buf
          local opts = { buffer = buf, noremap = true, silent = true }
          local map = vim.keymap.set

          -- map("n", "gd", vim.lsp.buf.definition, opts)
          -- map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })

      -- Optional: keep your custom configs here if desired
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("ts_ls", { settings = {} })

      vim.lsp.config("pyright", {
        settings = {
          python = { analysis = { typeCheckingMode = "strict" } },
        },
      })
    end,
  },
}
