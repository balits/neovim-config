print('Ébresztő, fütyi!')

require('themes')

require('base')
require('highlights')
require('maps')
require('plugins')

-- hack against slow nvim in fish
vim.opt.shell = "/bin/bash"
