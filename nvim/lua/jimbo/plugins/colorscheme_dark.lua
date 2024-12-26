return {
    -- "drewtempelmeyer/palenight.vim",
    dir = "~/random_repos/jimbonight.vim/",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme palenight")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "Comment", { fg = "#909090", italic = true })
    end,
}

-- return {
--     "navarasu/onedark.nvim",
--     priority = 1000,
--     config = function()
--         local onedark = require("onedark").setup({
--             -- toggle theme style ---
--             toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
--             toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
--             style = "cool",
--             transparent = true,
--             code_style = {
--                 comments = "italic",
--                 keywords = "none",
--                 functions = "none",
--                 strings = "none",
--                 variables = "none",
--             },
--         })
--         vim.cmd("colorscheme onedark")
--     end,
-- }

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         require("tokyonight").setup({
--             transparent = true,
--             styles = {
--                 comments = { italic = true },
--                 keywords = { italic = false },
--                 functions = {},
--                 variables = {},
--                 -- Background styles. Can be "dark", "transparent" or "normal"
--                 sidebars = "transparent", -- style for sidebars, see below
--                 floats = "transparent", -- style for floating windows
--             },
--         })
--         -- Optionally load the colorscheme after setup
--         vim.cmd("colorscheme tokyonight")
--     end,
-- }
