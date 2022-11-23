-- Bootstrap packer if necessary
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false
-- local lsp_filetypes = require("ag.lsp_config").lsp_filetypes

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Init setup
vim.cmd("packadd packer.nvim") -- load packer
local packer = require("packer")

packer.init({
    auto_reload_compiled = true,
})

packer.startup(function(use)
    -- Strictly required
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim") -- utility functions

    -- Essentials
    use({
        "nvim-telescope/telescope.nvim", -- fuzzy find ALL the things
        config = function() require("dwl.plugin-conf.telescope") end,
    })
    use({
        "windwp/nvim-ts-autotag", -- auto close html tags
        ft = { "html", "tsx", "typescriptreact", "javascriptreact" }
    })
    use({
        "windwp/nvim-autopairs", -- auto close sybmols
        config = function()
            require("nvim-autopairs").setup({
                map_cr = true, -- send closing symbol to its own line
                check_ts = true, -- use treesitter
            })
        end,
        disable_filetype = { "TelescopePrompt", "fugitive" },
    })

    -- Colourschemes
    use({
        "folke/tokyonight.nvim",
        config = function() require("dwl.plugin-conf.tokyonight") end,
    })
    use("lukas-reineke/indent-blankline.nvim")

    -- Look and feel
    use({
        "nvim-lualine/lualine.nvim", -- statusline in lua
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
        config = function() require("dwl.plugin-conf.lualine") end,
    })
    -- use({
    --     "nvim-tree/nvim-web-devicons",
    --     config = function() require('nvim-web-devicons').setup() end,
    -- })
    use({
        "petertriho/nvim-scrollbar",
        config = function() require("scrollbar").setup() end,
    })

    -- LSP & Treesitter
    use("neovim/nvim-lspconfig") -- basic configurations for LSP client
    use("jose-elias-alvarez/null-ls.nvim") -- bridge between LSP client and external formatters/linters, not full fledged language servers
    use({
        "nvim-treesitter/nvim-treesitter", -- treesitter
        run = ":TSUpdate",
    })

    -- Nice to have
    use("tpope/vim-commentary") -- commenting
    use("tpope/vim-surround") -- surround
    use("tpope/vim-fugitive") -- git
    use({
        "jose-elias-alvarez/nvim-lsp-ts-utils", -- helpers for typescript development
        ft = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
        },
    })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({
        "hrsh7th/nvim-cmp", -- autocomplete
        requires = {
            -- completion sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-path",
            -- complements
            "onsails/lspkind-nvim", -- add the nice source + completion item kind to the menu
        },
        config = function() require("dwl.plugin-conf.completion") end,
        module = "cmp",
    })

    if packer_bootstrap then packer.sync() end
end)

return packer_bootstrap
