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

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

