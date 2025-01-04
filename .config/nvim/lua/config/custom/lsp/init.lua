local A = require("config.custom.lsp.on_attach")
local M = {
  bashls = {},
  biome = {},
  cssls = {},
  emmet_language_server = {},
  --  eslint = {},
  -- harper_ls = {},
  html = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        hint = {
          enable = true,
          arrayIndex = "Disable",
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = false,
        },
      },
    },
  },
  svelte = {},
  tailwindcss = {},
  taplo = {},
  texlab = {},
  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayVariableTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayVariableTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}

for key, _ in pairs(M) do
  M[key].on_attach = A.on_attach
---  M[key].capabilities = A.capabilities
---  M[key].capabilities.textDocument.completion.completionItem.snippetSupport = true
end

return M
