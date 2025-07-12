-- vim.api.nvim_create_autocmd('TextYankPost', {
--     desc = 'Highlight when yanking (copying) text',
--     group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 65 })
	end,
	group = group,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- defaults:
		-- https://neovim.io/doc/user/news-0.11.html#_defaults

		local tele = require("telescope.builtin")
		-- TODO: Add telescope finders

		-- map("gR", "Show LSP references", "<cmd>Telescope lsp_references<CR>")
		map("gD", vim.lsp.buf.declaration, "Go to declaration")
		-- map("gi", "<cmd>Telescope lsp_implementations<CR>", "Go to implementation")
		-- map("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Go to type definition")
		-- map("gd", "<cmd>Telescope lsp_definitions<CR>", "Go to definition")
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

		map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics")
		map("<leader>d", vim.diagnostic.open_float, "Line diagnostics")
		-- TODO: Replace these with non-dep...
		-- map("n", "[d", vim.lsp.diagnostic.goto_prev, "Previous diagnostic")
		-- map("n", "]d", vim.lsp.diagnostic.goto_next, "Next diagnostic")

		map("<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
		-- map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
		-- map("K", vim.lsp.buf.hover, "Hover Documentation")
		-- map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
		-- map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>la", vim.lsp.buf.code_action, "Code Action")
		-- map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
		map("<leader>lf", vim.lsp.buf.format, "Format")
		map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

		-- Telescope Finders
		-- TODO: Get rid of repeated commands, and standardise them
		map("gd", tele.lsp_definitions, "Goto definition")
		map("<leader>fds", tele.lsp_document_symbols, "Doc Symbols")
		map("<leader>fS", tele.lsp_dynamic_workspace_symbols, "Dynamic Symbols")
		map("<leader>ft", tele.lsp_type_definitions, "Goto Type def")
		map("<leader>fr", tele.lsp_references, "Goto References")
		map("<leader>fi", tele.lsp_implementations, "Goto Implment")

		map("K", vim.lsp.buf.hover, "Hover documentation")
		map("<leader>E", vim.diagnostic.open_float, "Diagnostic Float")
		map("<leader>k", vim.lsp.buf.signature_help, "Sig Help")
		map("<leader>rn", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("<leader>wf", vim.lsp.buf.format, "Format Buffer")

		vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP: Code Action" })

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
			-- When cursor moves: Clears the highlighting
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- When LSP detaches: Clears the highlighting
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true
	end,
})
