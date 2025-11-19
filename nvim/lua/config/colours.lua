-- vim.cmd("colorscheme palenight")
-- vim.cmd("colorscheme rigel")
vim.cmd("colorscheme ayu")

-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#242933" })
--
-- -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1b1f26" })
-- -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1b1f26", fg = "#3e4452" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3e4452" })
--
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

-- -- CursorLine 50% Transparency
-- vim.api.nvim_set_hl(0, "CursorLine", {
-- 	bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg,
-- 	blend = 10,
-- })

vim.api.nvim_set_hl(0, "CursorLine", {
	bg = 2633788, -- Dark gray that looks semi-transparent
	-- blend = 50, -- Additional blending
})

--
-- vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#ffffff", bg = "none", nocombine = true })
-- -- optionally adjust picker background
-- vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
--
-- vim.cmd[[colorscheme tokyonight-night]]

vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#ffffff", bg = "none", nocombine = true })
-- optionally adjust picker background
vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
