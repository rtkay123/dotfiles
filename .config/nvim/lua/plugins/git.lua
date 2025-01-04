return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "ibhagwan/fzf-lua", -- optional
    },
    event = "VeryLazy",
    keys = {
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit push" },
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    opts = {
      integrations = {
        telescope = nil,
        diffview = true,
        fzf_lua = true,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {},
  },
}
