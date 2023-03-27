local M = require('kawaki/lsp')

local servers = { "tsserver", "eslint", "tailwindcss" }

for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    }

    require 'lspconfig'[server].manager.try_add_wrapper()
end

local group = vim.api.nvim_create_augroup("KillPrettier", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
    command = "killall prettier",
    group = group
})
