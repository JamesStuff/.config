local harpoon = require("harpoon")

vim.keymap.set("n", "<C-h>", function()
    harpoon:list():select(1)
end, { desc = "Harpoon 1" })

vim.keymap.set("n", "<C-j>", function()
    harpoon:list():select(2)
end, { desc = "Harpoon 2" })

vim.keymap.set("n", "<C-k>", function()
    harpoon:list():select(3)
end, { desc = "Harpoon 3" })

vim.keymap.set("n", "<C-l>", function()
    harpoon:list():select(4)
end, { desc = "Harpoon 4" })

vim.keymap.set("n", "<leader><C-h>", function()
    harpoon:list():replace_at(1)
end, { desc = "Harpoon: Set slot 1" })

vim.keymap.set("n", "<leader><C-j>", function()
    harpoon:list():replace_at(2)
end, { desc = "Harpoon: Set slot 2" })

vim.keymap.set("n", "<leader><C-k>", function()
    harpoon:list():replace_at(3)
end, { desc = "Harpoon: Set slot 3" })

vim.keymap.set("n", "<leader><C-l>", function()
    harpoon:list():replace_at(4)
end, { desc = "Harpoon: Set slot 4" })
