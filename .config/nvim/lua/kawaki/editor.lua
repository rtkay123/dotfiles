local set = vim.opt
set.laststatus = 0 -- remove status bar
set.nu = true
set.rnu = true
set.showmode = false


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
vim.opt.scrolloff = 8
set.incsearch = false
set.termguicolors = true

set.updatetime = 50
set.signcolumn = "yes"

if vim.fn.executable("rg") then
    -- if ripgrep installed, use that as a grepper
    set.grepprg = "rg --vimgrep --no-heading --smart-case"
    set.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- set.colorcolumn = "80"

vim.g.mapleader = " "
set.completeopt = { 'menu', 'menuone', 'noselect' }


local signs = { Error = " ", Warn = " ", Hint = "󰛨 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

------------------------------------------------------------------------------------
