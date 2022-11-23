-- Mapping helper
local mapper = function(mode, key, result) vim.keymap.set(mode, key, result, { noremap = true, silent = true }) end
local no_plugins = require("dwl.plugins")

mapper("n", "<C-h>", "<C-w>h")
mapper("n", "<C-j>", "<C-w>j")
mapper("n", "<C-k>", "<C-w>k")
mapper("n", "<C-l>", "<C-w>l")

mapper("n", "gd", ":vs | lua vim.lsp.buf.definition()<CR>") -- open defn in a new vsplit

if no_plugins then return end

-- Telescope integration
local telescope_builtin = require("telescope.builtin")

mapper("n", "<Leader>ff", telescope_builtin.find_files) -- search all files, respecting .gitignore if one exists
mapper("n", "<Leader>fb", telescope_builtin.buffers) -- search open buffers
mapper("n", "<Leader>fl", telescope_builtin.current_buffer_fuzzy_find) -- search lines in current buffer
mapper("n", "<Leader>gg", telescope_builtin.live_grep) -- search all lines in project
mapper("n", "<Leader>fr", telescope_builtin.lsp_references) -- search references to symbol under cursor
mapper("n", "<Leader>gc", telescope_builtin.git_branches) -- checkout different branches

-- Git things
mapper("n", "<Leader>gs", ":vs Git<CR>") -- `git status` in a new tab to save screen real estate
mapper("n", "<Leader>gd", "<cmd>Gdiffsplit<CR>") -- open a split diffing the current file
