return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = false,
			ignore_install = { "javascript" },
			modules = {},
			highlight = {
				enable = true,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			auto_install = true,
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"glsl",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				-- "dockerfile",
				"gitignore",
				"query",
				"c",
				"cpp",
				"go",
				"rust",
				"haskell",
				"python",
				"zig",
				"vimdoc",
				"luadoc",
				"luap",
				"ocaml",
				"regex",
				"gomod",
				"gowork",
				"gosum",
				"ninja",
				"rst",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,

					-- Rest from template, have a look to see how it can be used
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = { query = "@function.outer", desc = "around a function" },
						["if"] = { query = "@function.inner", desc = "inner part of a function" },
						["ac"] = { query = "@class.outer", desc = "around a class" },
						["ic"] = { query = "@class.inner", desc = "inner part of a class" },
						["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
						["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
						["al"] = { query = "@loop.outer", desc = "around a loop" },
						["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
						["ap"] = { query = "@parameter.outer", desc = "around parameter" },
						["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@parameter.inner"] = "v", -- charwise
						["@function.outer"] = "v", -- charwise
						["@conditional.outer"] = "V", -- linewise
						["@loop.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = false,
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "Previous function" },
						["[c"] = { query = "@class.outer", desc = "Previous class" },
						["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
					},
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "Next function" },
						["]c"] = { query = "@class.outer", desc = "Next class" },
						["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
					},
				},
				swap = {
					enable = true,
					-- swap_next = {
					-- ["<leader>a"] = "@parameter.inner",
				},
				-- swap_previous = {
				-- ["<leader>A"] = "@parameter.inner",
				-- },
				-- },
			},
		})
	end,
}
