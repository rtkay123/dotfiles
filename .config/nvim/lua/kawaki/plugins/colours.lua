return {
    --    {
    --        "loctvl842/monokai-pro.nvim",
    --        lazy = true,
    --        config = function()
    --            require("monokai-pro").setup({
    --                filter = "machine"
    --            })
    --        end
    --    },
    -- EVERFOREST
    {
        "neanias/everforest-nvim",
        --  version = false,
        lazy = true,
        --        lazy = false,
        --        priority = 1000, -- make sure to load this before all the other start plugins
        --        --  -- Optional; default configuration will be used if setup isn't called.
        --        config = function()
        --            require("everforest").setup({
        --                italics = true,
        --                background = "hard",
        --                transparent_background_level = 0
        --            })
        --            require("everforest").load()
        --            vim.api.nvim_set_hl(0, 'StatusLine', { bg = "#272e33" })
        --            --         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --            --         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        --        end,
    },
    -- GRUVBOX MATERIAL
    {
        'sainnhe/gruvbox-material',
        lazy = true,
    },
    {
        'b4skyx/serenade',
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.g.serenade_better_performance = 1
            vim.cmd.colorscheme("serenade")
        end,
    }
}
