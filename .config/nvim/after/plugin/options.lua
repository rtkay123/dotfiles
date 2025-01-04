local set = vim.opt
-- set.laststatus = 0 -- remove status bar
set.nu = true
set.rnu = true
set.showmode = false
set.smartcase = true
set.ignorecase = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.guicursor = "" -- use fat cursor in insert

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
set.undofile = true

set.hlsearch = false
set.scrolloff = 8
set.incsearch = false
set.termguicolors = true

set.updatetime = 50
set.signcolumn = "yes"

set.colorcolumn = "80"

local severity = vim.diagnostic.severity

vim.diagnostic.config {
    signs = { text = { [severity.ERROR] = " ", [severity.WARN] = " ", [severity.HINT] = "󰛨 ", [severity.INFO] = " " } }
}
