local M = require('kawaki/lsp')

local servers = { "ruff_lsp", "pyright" }

for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        init_options = {
            settings = {
                -- Any extra CLI arguments for `ruff` go here.
                args = {},
            }
        }
    }

    require 'lspconfig'[server].manager.try_add_wrapper()
end
