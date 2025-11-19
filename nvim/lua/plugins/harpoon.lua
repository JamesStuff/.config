return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		-- Snacks picker configuration for Harpoon
		local function toggle_snacks_picker(harpoon_files)
			local items = {}
			for i, item in ipairs(harpoon_files.items) do
				table.insert(items, {
					idx = i,
					file = item.value,
					text = item.value,
				})
			end

			Snacks.picker({
				title = "Harpoon",
				items = items,
				format = function(item, _)
					local ret = {}
					local icon, icon_hl = Snacks.util.icon(item.file)
					ret[#ret + 1] = { icon .. " ", icon_hl }
					ret[#ret + 1] = { item.text }
					return ret
				end,
				confirm = function(picker, item)
					picker:close()
					if item then
						vim.cmd("edit " .. item.file)
					end
				end,
			})
		end

		vim.keymap.set("n", "<C-e>", function()
			toggle_snacks_picker(harpoon:list())
		end, { desc = "Open harpoon window" })

		-- Add item to Harpoon list
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
			print("File added to Harpoon list")
		end, { desc = "Add item to Harpoon list" })

		-- Quick change keymaps
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end)

		-- Replace file in harpoon slot
		vim.keymap.set("n", "<leader><C-h>", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<leader><C-j>", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<leader><C-k>", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<leader><C-l>", function()
			harpoon:list():replace_at(4)
		end)

		vim.keymap.set("n", "<leader>h", function()
			toggle_snacks_picker(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
