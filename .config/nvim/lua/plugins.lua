local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, 'packer')

if (not status) then
    print("Packer not installed")
    return
end

vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

packer.startup(function(use)
    use 'wbthomason/packer.nvim'  -- Packer can manage itself

    -- LSP settings
    use 'neovim/nvim-lspconfig' -- LSP configs
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP

    -- Useful completion sources:
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Helper for installing LSP servers
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
    }

    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup()
        end
    }

    -- Gruvbox color theme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd [[colorscheme tokyonight]]
            require('highlights')
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup()
        end
    }

    -- Fast status bar written in lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('lualine').setup {
                options = { theme = 'iceberg_dark' },
            }
        end
    }

    -- Git
    use 'airblade/vim-gitgutter'

    -- GitHub Copilot
    use {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = '<C-CR>',
                        accept_line = '<C-l>',
                        accept_word = '<C-w>',
                        next = '<C-k>',
                        prev = '<C-j>',
                    }
                }
            })
        end,
    }

    -- Adds extra functionality over rust analyzer
    use("simrat39/rust-tools.nvim")

    -- LSP settings
    if packer_bootstrap then
        require('packer').sync()
    end

end)

