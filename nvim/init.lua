-- mostly sourced from https://github.com/garcia5/dotfiles/blob/master/files/nvim/init.lua

-- Essentials
vim.g.mapleader = " "
vim.g.bulitin_lsp = true

-- load my config
require("dwl")

-- Behaviours
vim.opt.belloff = "all" -- NO BELLS!
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- ins-completion how vsnip likes it
vim.opt.swapfile = false -- no swap files
vim.opt.inccommand = "nosplit" -- preview %s commands live as I type
-- vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
-- vim.opt.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
vim.opt.mouse = "nv" -- use mouse in normal, visual modes
vim.opt.mousescroll = "ver:3,hor:0" -- scroll vertically by 3 lines, no horizontal scrolling
vim.opt.clipboard = "unnamed"

-- Indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 2 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 2 -- <Tab> behaves as 4 spaces when editing
vim.opt.copyindent = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.cmd("colorscheme tokyonight-night")

-- Look and feel
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- show the sign column always
vim.opt.cursorline = false -- don't highlight current line
vim.opt.list = true -- show list chars
vim.opt.listchars = {
    -- these list chars
    tab = "<->",
    nbsp = "␣",
    extends = "…",
    precedes = "…",
    trail = "·",
    multispace = "·", -- show chars if I have multiple spaces between text
    leadmultispace = " ", -- ...but don't show any when they're at the start
}
vim.opt.scrolloff = 2 -- padding between cursor and top/bottom of window
-- vim.opt.foldlevel = 0 -- allow folding the whole way down
-- vim.opt.foldlevelstart = 99 -- open files with all folds open
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer splitting below
vim.opt.wrap = false -- don't wrap my text
-- vim.opt.textwidth = 120 -- wrap here for comments by default
vim.opt.cursorline = true -- hightlight line cursor is on
-- vim.opt.laststatus = 3 -- single global statusline

-- Searching
-- vim.opt.wildmenu = true -- tab complete on command line
vim.opt.ignorecase = true -- case insensitive search...
vim.opt.smartcase = true -- unless I use caps
vim.opt.hlsearch = true -- highlight matching text
vim.opt.incsearch = true -- update results while I type

-- Better Netrw
vim.g.netrw_banner = 0 -- Hide banner
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore
