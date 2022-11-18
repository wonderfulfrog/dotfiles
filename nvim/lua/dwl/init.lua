-- require("ag.autocmd") -- lua autocommands
local no_plugins = require("dwl.plugins") -- plugins
require("dwl.mappings") -- keymaps
if no_plugins then return end
require("dwl.lsp_config") -- LSP configs
require("dwl.treesitter") -- treesitter configs