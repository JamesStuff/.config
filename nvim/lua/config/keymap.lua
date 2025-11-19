local keymap = vim.keymap
local Snacks = require("snacks")

-- Files
keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files in cwd" })
keymap.set("n", "<leader>fR", function()
	Snacks.picker.recent()
end, { desc = "Find recent files" })
keymap.set("n", "<leader>fs", function()
	Snacks.picker.grep()
end, { desc = "Live grep in cwd" })
keymap.set("n", "<leader>fc", function()
	Snacks.picker.grep_word()
end, { desc = "Grep string under cursor" })

-- TODO: s (assuming you're using todo-comments + Snacks)
keymap.set("n", "<leader>ft", function()
	Snacks.picker.todo_comments()
end, { desc = "Find TODOs" })
keymap.set("n", "<leader>fq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })
keymap.set("n", "<leader>fT", function()
	Snacks.picker()
end, { desc = "Open Snacks picker menu" })

keymap.set("n", "<leader>fn", function()
	Snacks.picker.files({
		cwd = vim.fn.stdpath("config"),
		title = "Find files in .config/nvim",
	})
end, { desc = "Find files in .config/nvim" })

keymap.set("n", "<leader>fN", function()
	Snacks.picker.grep({
		cwd = vim.fn.stdpath("config"),
		title = "Live Grep .config/nvim",
	})
end, { desc = "Find strings in .config/nvim" })

-- Buffers & Help
keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
keymap.set("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Help tags" })
keymap.set("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
keymap.set("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notifications" })

-- LSP
keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
keymap.set("n", "gr", function()
	Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
keymap.set("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
keymap.set("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
-- keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
keymap.set("n", "<leader>fS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

-- Other Pickers
keymap.set("n", "fC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colourschemes" })
