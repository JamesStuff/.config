return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
        animate = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		image = { enabled = true },
		input = { enabled = false },
        rename = { enabled = true },
		indent = {
			indent = {
				char = "┊",
				priority = 100,
				enabled = true,
			},
			animate = {
				enabled = true,
				style = "out",
				easing = "linear",
				duration = {
					step = 20, -- ms per step
					total = 100, -- maximum duration
				},
			},
		},
		--TODO: Play with chunks...

		picker = { 
            enabled = true,
            -- defaults = {
            --     layout = {
            --         anchor = "SW",      -- south-west corner (bottom-left)
            --         relative = "editor",
            --         row = 0.95,         -- near the bottom (0 = top, 1 = bottom)
            --         col = 0.5,          -- horizontally centered
            --         width = 0.8,        -- 80% of editor width
            --     },
            -- },
        },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = {
            enabled = true,
            animate = {
                duration = { steps = 10, total = 100, easing = "linear" },
            },
        },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
