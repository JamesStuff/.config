local group = vim.api.nvim_create_augroup("JIMBO", { clear = true })

-- Flashes highlight on yanked section
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 60 })
    end,
    group = group,
})

-- Clear whitespace on save and format
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.cmd([[:%s/\s\+$//e]])
        vim.lsp.buf.format()
    end,
    group = group,
})

-- ciq: Function to determine which quote is first and perform the corresponding `ci` operation
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
