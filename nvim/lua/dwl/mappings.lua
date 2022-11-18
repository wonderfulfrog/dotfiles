-- Mapping helper
local mapper = function(mode, key, result) vim.keymap.set(mode, key, result, { noremap = true, silent = true }) end
local no_plugins = require("dwl.plugins")

mapper("n", "<C-h>", "<C-w>h")
mapper("n", "<C-j>", "<C-w>j")
mapper("n", "<C-k>", "<C-w>k")
mapper("n", "<C-l>", "<C-w>l")

mapper("n", "gd", ":vs | lua vim.lsp.buf.definition()<CR>") -- open defn in a new vsplit

if no_plugins then return end

local telescope_builtin = require("telescope.builtin")

mapper("n", "<C-p>", telescope_builtin.find_files) -- search all files, respecting .gitignore if one exists