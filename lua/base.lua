--print('base loaded:P')base
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim commands
vim.wo.number = true

-- shorthands
local o = vim.o
local g = vim.g
vim.cmd [[set clipboard+=unnamedplus]]

o.cmdheight = 0
o.ignorecase = true
o.showcmd = true
o.title = true
o.showcmd = false
o.autoindent = true
o.hlsearch = true
o.backup = false
o.showcmd = true
o.cmdheight = 1
o.laststatus = 2
o.expandtab = true
o.scrolloff = 10
o.shell = "fish"
o.inccommand = 'split'
o.ignorecase = true
o.smarttab = true
o.breakindent = true
o.shiftwidth = 2
o.tabstop = 2
o.ai = true --autoindnet
o.si = true --smart indent
o.wrap = false -- no wrapping lines
o.backspace = 'start,eol,indent'
-- o.path:append { '**' } -- finding files
