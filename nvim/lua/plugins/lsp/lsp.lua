return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",

		dependencies = { "mason-org/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
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
				-- ensure_installed = {
				--     "lua_ls",
				--     "ts_ls",
				--     "pyright",
				--     "gopls",
				--     "pyright",
				--     "ruff",
				--     "rust_analyzer",
				--     "html",
				--     "lua_ls",
				--     "jdtls",
				--     "glsl_analyzer",
				--     "bashls",
				--     "clangd",
				--     "cmake",
				--     "htmx",
				--     "texlab",
				--     -- "hls",
				--     "sqls",
				--     "zls",
				--     "jsonls",
				-- },
				-- automatic_installation = true,
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
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Global LSP defaults
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
			})

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

			local function get_python_path()
				local path
				local source

				-- Check for UV virtual environment first
				local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
				if vim.fn.executable(venv_path) == 1 then
					path = venv_path
					source = "UV (.venv)"
				else
					-- Fallback to pyenv
					local pyenv_python = vim.fn.systemlist("pyenv which python")[1]
					if pyenv_python and vim.fn.executable(pyenv_python) == 1 then
						path = pyenv_python
						source = "pyenv"
					else
						-- Final fallback to system Python
						path = vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
						source = "system"
					end
				end

				-- Send notification
				vim.notify(
					string.format("Python: %s\nSource: %s", path, source),
					vim.log.levels.INFO,
					{ title = "Pyright Python Path" }
				)

				return path
			end

			-- For your existing setup, use this in your vim.lsp.config():
			vim.lsp.config("pyright", {
				python = {
					pythonPath = get_python_path(),
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
						reportUnusedParameter = "none",
						reportUnusedFunction = "none",
					},
					hints = {
						reportUnusedParameter = "none",
						reportUnusedFunction = "none",
					},
				},
			})
		end,
	},
}
