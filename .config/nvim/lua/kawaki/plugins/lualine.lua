return {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    config = function()
        require('lualine').setup {
            options = {
                section_separators = '',
                component_separators = '',
                disabled_filetypes = { 'neo-tree', 'NvimTree' },
            },
            sections = {
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { {
                    require('lazy.status').updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#dbbc7f" }

                }, 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_winbar = {},
            extensions = {}
        }
    end
}
