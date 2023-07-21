-- Enable syntax highlighting and select color schemes
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.cursorline = true
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'

-- Make background completely transparent
vim.api.nvim_set_hl(0, "Normal", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = 0 })
