-- return {
-- 	"saghen/blink.cmp",
-- 	version = "*",
-- 	dependencies = {
-- 		"rafamadriz/friendly-snippets",
-- 	},
-- 	opts_extend = { "sources.default" },
-- 	opts = {
-- 		keymap = { preset = "default" },
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 		},
-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
-- 	},
-- }

-- return {
-- 	"saghen/blink.cmp",
-- 	dependencies = { 'rafamadriz/friendly-snippets' },
-- 	version = "1.*",
-- 	opts = {
-- 		keymap = {
-- 			preset = "default",
-- 			["<C-k>"] = { "select_prev", "fallback" },
-- 			["<C-j>"] = { "select_next", "fallback" },
-- 			["<C-s>"] = { "show_signature", "hide_signature" },
-- 		},
-- 		appearance = { nerd_font_variant = "mono" },
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 		},
-- 		signature = { enabled = true },
-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
-- 	},
-- 	opts_extend = { "sources.default" },
-- }

-- return {
-- 	"saghen/blink.cmp",
-- 	dependencies = { "rafamadriz/friendly-snippets" },
-- 	version = "1.*",
-- 	opts = {
-- 		keymap = {
-- 			preset = "default",
--
-- 			-- Tab to accept completion or move to next item
-- 			["<Tab>"] = {
-- 				function(cmp)
-- 					if cmp.is_visible() then
-- 						return cmp.accept()
-- 					else
-- 						return cmp.show()
-- 					end
-- 				end,
-- 				"fallback",
-- 			},
--
-- 			-- Shift-Tab to move to previous item
-- 			["<S-Tab>"] = {
-- 				function(cmp)
-- 					if cmp.is_visible() then
-- 						return cmp.select_prev()
-- 					end
-- 				end,
-- 				"fallback",
-- 			},
--
-- 			-- Ctrl-n/p for navigation (optional, classic vim style)
-- 			["<C-n>"] = { "select_next", "fallback" },
-- 			["<C-p>"] = { "select_prev", "fallback" },
--
-- 			-- Ctrl-space to manually trigger completion
-- 			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
--
-- 			-- Escape to close
-- 			["<C-e>"] = { "hide" },
-- 			["<Esc>"] = { "hide", "fallback" },
--
--
--             ['.'] = { 'fallback' },
-- 		},
--
-- 		-- Appearance configuration
-- 		appearance = {
-- 			use_nvim_cmp_as_default = true,
-- 			nerd_font_variant = "mono",
-- 		},
--
-- 		-- Completion menu configuration
-- 		completion = {
-- 			menu = {
-- 				draw = {
-- 					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
-- 				},
-- 			},
-- 			documentation = {
-- 				auto_show = true,
-- 				auto_show_delay_ms = 500,
-- 			},
-- 			ghost_text = {
-- 				enabled = true,
-- 			},
-- 		},
--
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 		},
--
-- 		cmdline = {
-- 			enabled = true,
-- 		},
--
-- 		-- Signature help configuration
-- 		signature = {
-- 			enabled = true,
-- 		},
-- 	},
-- }

-- return {
-- 	"saghen/blink.cmp",
-- 	dependencies = "rafamadriz/friendly-snippets",
-- 	version = "*",
-- 	opts = {
-- 		keymap = {
-- 			preset = "super-tab",
-- 			-- Optional: customize individual keys if needed
-- 			-- ['<CR>'] = { 'accept', 'fallback' },
-- 			-- ['.'] = { 'fallback' },
-- 		},
-- 		appearance = {
-- 			use_nvim_cmp_as_default = true,
-- 			nerd_font_variant = "mono",
-- 		},
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 		},
--
-- 		completion = {
-- 			ghost_text = {
-- 				enabled = true,
-- 				show_without_selection = true,
-- 			},
-- 			trigger = {
-- 				show_on_backspace = true,
-- 			},
-- 			list = {
-- 				selection = {
-- 					preselect = false,
-- 					auto_insert = false,
-- 				}, -- Don't auto-select first item
-- 			},
-- 		},
-- 	},
-- }

-- return {
-- 	"saghen/blink.cmp",
-- 	dependencies = "rafamadriz/friendly-snippets",
-- 	version = "v0.*",
-- 	opts = {
-- 		keymap = {
-- 			preset = "super-tab", -- Tab accepts completion
-- 			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
-- 			["<C-e>"] = { "hide" },
-- 			["<CR>"] = { "fallback" }, -- Enter just creates new line
-- 		},
--
-- 		completion = {
-- 			list = {
-- 				selection = {
-- 					preselect = false, -- Don't auto-select first item
-- 					auto_insert = false, -- Don't auto-insert selected item into buffer
-- 				},
-- 			},
--
-- 			menu = {
-- 				auto_show = true, -- Show menu automatically
-- 			},
--
-- 			documentation = {
-- 				auto_show = true,
-- 				auto_show_delay_ms = 500,
-- 			},
--
-- 			ghost_text = {
-- 				enabled = true, -- Show ghost text preview
-- 			},
-- 		},
-- 	},
-- }

return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "fallback" }, -- Enter just creates new line, doesn't accept
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "cmdline",
				["<Right>"] = false,
				["<Left>"] = false,
			},
			completion = {
				list = { selection = { preselect = false } },
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
					end,
				},
				ghost_text = { enabled = true },
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },

			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		completion = {
			trigger = {
				show_on_backspace = true,
			},

			list = {
				selection = {
					preselect = false, -- Don't auto-select first item
					auto_insert = false, -- Don't auto-insert into buffer
				},
			},

			menu = {
				auto_show = true, -- Show menu automatically
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},

			ghost_text = {
				enabled = true, -- Show ghost text preview
				show_without_selection = true, -- Show even when nothing selected
			},
		},
	},
}
