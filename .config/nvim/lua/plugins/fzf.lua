return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
  },
  opts = { "skim" },
}
