vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Makes 1/2 page up and down go to the middle
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
keymap.set("n", "<C-f>", "<C-f>zz", { noremap = true })
keymap.set("n", "<C-b>", "<C-b>zz", { noremap = true })

-- Searching go to the middle
keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

keymap.set("n", "*", "*zzzv", { noremap = true, silent = true })
keymap.set("n", "#", "Nzzzv", { noremap = true, silent = true })

keymap.set("n", "}", "}zzzv", { noremap = true, silent = true })
keymap.set("n", "{", "{zzzv", { noremap = true, silent = true })

-- Indent fix whole file
keymap.set("n", "<leader>i", "ggVG=", { desc = "Indent whole file", noremap = true, silent = true })

-- Increment and Decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to sext tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Disable arrow keys in normal, insert, and visual modes with a message
keymap.set("n", "<Up>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("n", "<Down>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("n", "<Left>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("n", "<Right>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })

keymap.set("i", "<Up>", '<Esc>:lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("i", "<Down>", '<Esc>:lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("i", "<Left>", '<Esc>:lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("i", "<Right>", '<Esc>:lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })

keymap.set("v", "<Up>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("v", "<Down>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("v", "<Left>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })
keymap.set("v", "<Right>", ':lua print("Arrow keys are disabled")<CR>', { noremap = true, silent = true })

-- Accounting for shift being held down for to long when doing :wa
vim.api.nvim_create_user_command("Wa", "wa", {})

-- Apply the first spelling suggestion to a word
keymap.set("n", "<leader>z", "1z=", { desc = "Spelling: Apply first suggestion" }) -- split window vertically

-- TODO: Have a look at Prime's nice re-mappings...
--
-- Move lines up and down in Visual mode?
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ciq: Function to determine which quote is first and perform the corresponding `ci` operation
-- TODO: Have a look at if you can add a custom block q, without messing up
-- normal functionality.
local function change_inside_quote()
	local line = vim.api.nvim_get_current_line()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)[2] + 1

	local single_quote_pos = line:find("'", cursor_pos)
	local double_quote_pos = line:find('"', cursor_pos)

	if single_quote_pos and double_quote_pos then
		if single_quote_pos < double_quote_pos then
			vim.api.nvim_feedkeys("ci'", "n", false)
		else
			vim.api.nvim_feedkeys('ci"', "n", false)
		end
	elseif single_quote_pos then
		vim.api.nvim_feedkeys("ci'", "n", false)
	elseif double_quote_pos then
		vim.api.nvim_feedkeys('ci"', "n", false)
	else
		print("No quotes found on this line.")
	end
end

vim.keymap.set(
	"n",
	"ciq",
	change_inside_quote,
	{ noremap = true, silent = true, desc = "Change inside the first single or double quote" }
)
