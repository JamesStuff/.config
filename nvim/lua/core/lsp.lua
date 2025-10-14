vim.lsp.enable({
  "gopls",
  "lua_ls",
  "pyright",
  "clangd",
  "jsonls",
  "jdtls",
  "zls",
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      pythonPath = vim.fn.systemlist("pyenv which python")[1],
      analysis = {
        typeCheckingMode = "basic",
        reportFunctionMemberAccess = "none",
        reportUnusedFunction = "none",
      },
    },
  },
})
