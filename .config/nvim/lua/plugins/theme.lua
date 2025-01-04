return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
        groups = {
          all = {
            NormalFloat = { fg = "fg1", bg = "NONE" },
          },
        },
      })
      vim.cmd.colorscheme("terafox")
      local palette = require("nightfox.palette").load("terafox")
      
      vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { bg = "NONE", fg = palette.fg3 })
    end,
  },
}
