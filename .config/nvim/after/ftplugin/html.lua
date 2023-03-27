local M = require('kawaki/lsp')

-- vim.opt.formatprg = "prettierd --stdin-filepath=%"
vim.opt_local.formatprg = "prettierd %"

--local fmtGroup = vim.api.nvim_create_augroup("FormatHTML", { clear = true })
--vim.api.nvim_create_autocmd("BufWritePre", {
--    group = fmtGroup,
--    callback = function()
--        local r, c = unpack(vim.api.nvim_win_get_cursor(0))
--        vim.cmd [[silent %!prettierd % ]]
--        if vim.v.shell_error ~= 0 then
--            vim.cmd.undo()
--        end
--        vim.api.nvim_win_set_cursor(0, { r, c })
--    end
--})

local group = vim.api.nvim_create_augroup("KillPrettier", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
    command = "killall prettier",
    group = group
})


require('lspconfig').html.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}

require 'lspconfig'.html.manager.try_add_wrapper()
