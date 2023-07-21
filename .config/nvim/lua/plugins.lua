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
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'neovim/nvim-lspconfig' -- LSP configs
    use 'hrsh7th/nvim-cmp' -- Completion

    -- Fast status bar written in lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --use 'zbirenbaum/copilot.lua'
    use 'github/copilot.vim'

    -- LSP settings
    if packer_bootstrap then
        require('packer').sync()
    end

end)

