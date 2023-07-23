-- General
vim.opt.cmdheight = 3
vim.opt.wildmode = 'longest:full,full'
vim.opt.wrap = true
vim.opt.title = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.autoindent = true
vim.opt.showtabline = 1
vim.opt.relativenumber = true -- Show line numbers relative to current line
vim.opt.nu = true --'rnu' -- Set only the current line to be absolute

-- VGit
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

-- Adjust tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
