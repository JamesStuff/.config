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
        vim.lsp.buf.format()

        -- Remove whitespace
        vim.cmd([[:%s/\s\+$//e]])
    end,
    group = group,
})
