return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  -- {
  --   "saghen/blink.cmp",
  --   dependencies = { "rafamadriz/friendly-snippets", "lukas-reineke/cmp-rg" },
  --   version = "*",
  --   ---@module 'blink.cmp'
  --   ---@type blink.cmp.Config
  --   opts = {
  --     keymap = { preset = "default" },
  --     completion = {
  --       ghost_text = { enabled = true },
  --     },
  --     appearance = {
  --       use_nvim_cmp_as_default = true,
  --       nerd_font_variant = "mono",
  --     },
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer", "rg" },
  --       providers = {
  --         rg = {
  --           name = "rg",
  --           module = "blink.compat.source",
  --           score_offset = -3,
  --         },
  --       },
  --     },
  --   },
  --   opts_extend = { "sources.default" },
  -- },
  -- DOCS https://cmp.saghen.dev/configuration/reference
  --------------------------------------------------------------------------------

  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "*", -- REQUIRED needed to download pre-built binary

    -- PENDING https://github.com/Saghen/blink.cmp/issues/800
    init = function()
      vim.api.nvim_create_autocmd("FocusGained", {
        desc = "User: copy system clipboard to nvim",
        callback = function()
          vim.fn.setreg('"', vim.fn.getreg("+"))
        end,
      })
    end,

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      sources = {
        per_filetype = {
          ["rip-substitute"] = { "buffer" },
          gitcommit = {},
        },
        providers = {
          lsp = {
            fallbacks = {}, -- do not use `buffer` as fallback
            enabled = function()
              if vim.bo.ft ~= "lua" then
                return true
              end

              -- prevent useless suggestions when typing `--` in lua, but
              -- keep the useful `---@param;@return` suggestion
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local charsBefore = vim.api.nvim_get_current_line():sub(col - 2, col)
              local luadocButNotComment = not charsBefore:find("^%-%-?$") and not charsBefore:find("%s%-%-?")
              return luadocButNotComment
            end,
          },
          snippets = {
            -- don't show when triggered manually (= length 0), useful
            -- when manually showing completions to see available fields
            min_keyword_length = 1,
            score_offset = -1,
          },
          path = {
            opts = { get_cwd = vim.uv.cwd },
          },
          buffer = {
            max_items = 4,
            min_keyword_length = 4,
            score_offset = -3,

            opts = {
              -- show completions from all buffers used within the last x minutes
              get_bufnrs = function()
                local mins = 15
                local allOpenBuffers = vim.fn.getbufinfo({ buflisted = 1, bufloaded = 1 })
                local recentBufs = vim
                  .iter(allOpenBuffers)
                  :filter(function(buf)
                    local recentlyUsed = os.time() - buf.lastused < (60 * mins)
                    local nonSpecial = vim.bo[buf.bufnr].buftype == ""
                    return recentlyUsed and nonSpecial
                  end)
                  :map(function(buf)
                    return buf.bufnr
                  end)
                  :totable()
                return recentBufs
              end,
            },
          },
        },
      },
      keymap = { preset = "default" },
      completion = {
        trigger = {
          show_in_snippet = false, -- since we overload `<Tab>` with jumping & selection
        },
        keyword = {
          -- only numbers, letters, and `_`. Do not trigger on `` (default is '[-_]\\|\\k')
          -- does not affect LSP, who still trigger on `-` due to trigger chars
          regex = [[\a\|\d\|_]],
        },
        list = {
          cycle = { from_top = false }, -- cycle at bottom, but not at the top
          selection = "auto_insert",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
          window = {
            border = vim.g.borderStyle,
            max_width = 50,
            max_height = 20,
          },
        },
        menu = {
          border = vim.g.borderStyle,
          draw = {
            treesitter = { "lsp", "cmdline" },
            columns = {
              { "label", "label_description", "kind_icon", gap = 1 },
            },
            components = {
              label = { width = { max = 30 } }, -- more space for doc-win
              label_description = { width = { max = 20 } },
              kind_icon = {
                text = function(ctx)
                  -- detect emmet-ls
                  local source, client = ctx.item.source_id, ctx.item.client_id
                  local lspName = client and vim.lsp.get_client_by_id(client).name
                  if lspName == "emmet_language_server" then
                    source = "emmet"
                  end

                  -- use source-specific icons, and `kind_icon` only for items from LSPs
                  local sourceIcons = {
                    snippets = "󰩫",
                    buffer = "󰦨",
                    emmet = "",
                    path = "",
                    cmdline = "󰘳",
                  }
                  return sourceIcons[source] or ctx.kind_icon
                end,
              },
            },
          },
        },
      },
      appearance = {
        -- supported: tokyonight
        -- not supported: nightfox, gruvbox-material
        use_nvim_cmp_as_default = true,

        nerd_font_variant = "normal",
        kind_icons = {
          -- different icons of the corresponding source
          Text = "󰉿", -- `buffer`
          Snippet = "󰞘", -- `snippets`
          File = "", -- `path`

          Folder = "󰉋",
          Method = "󰊕",
          Function = "󰡱",
          Constructor = "",
          Field = "󰇽",
          Variable = "󰀫",
          Class = "󰜁",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Color = "󰏘",
          Reference = "",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "󰅲",
        },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
}
