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
    
    -- Completion
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        event = "VimEnter",
        config = 'vim.cmd[[COQnow]]'
    }
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

    -- Gruvbox color theme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd [[colorscheme tokyonight]]
            require('highlights')
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

    -- LSP settings
    if packer_bootstrap then
        require('packer').sync()
    end

end)

