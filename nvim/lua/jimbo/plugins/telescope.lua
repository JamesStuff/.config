-- TODO: Have a look at fzf-lua, seems to be in vogue at the moment...
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_strategy = "flex",
                layout_config = {
                    flex = {
                        -- flip_columns = 110,
                        flip_columns = 120,
                    },
                },
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs" })
        keymap.set("n", "<leader>fn", function()
            require("telescope.builtin").find_files({
                cwd = vim.fn.stdpath("config"),
                prompt_title = "Find files in .config/nvim",
            })
        end, { desc = "Find files in .config/nvim" })

        keymap.set("n", "<leader>fN", function()
            require("telescope.builtin").live_grep({
                cwd = vim.fn.stdpath("config"),
                prompt_title = "Live Grep .config/nvim",
            })
        end, { desc = "Find strings in .config/nvim" })
    end,
}
