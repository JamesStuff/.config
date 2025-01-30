local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "jimbo.plugins" },
	{ import = "jimbo.plugins.lsp" },
	-- spec = {
	-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },

	--   { import = "lazyvim.plugins.extras.ui.mini-animate" },
	-- { import = "lazyvim.plugins.extras.lang.clangd" },
	--   { import = "lazyvim.plugins.extras.lang.java" },
	--   { import = "lazyvim.plugins.extras.lang.json" },
	--   { import = "lazyvim.plugins.extras.lang.python" },
	--   { import = "lazyvim.plugins.extras.lang.yaml" },
	-- },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
				-- "gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
