local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer isn't installed")
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'hoob3rt/lualine.nvim' --status line
  use 'nvim-treesitter/nvim-treesitter' -- syntax highlights
  use 'nvim-lua/plenary.nvim' -- common utilities
  use 'TimUntersberger/neogit' -- git made easy

  --lsp
  use 'onsails/lspkind-nvim' --vscode like pictograms
  use 'neovim/nvim-lspconfig' -- lspconfig
  use 'glepnir/lspsaga.nvim' -- go to definition, preview, error diagnostics with pop up widgets

  --fuzzy finder
  use 'nvim-telescope/telescope.nvim' --yeees
  use 'nvim-telescope/telescope-file-browser.nvim' -- even more yees

  --completions
  use 'L3MON4D3/LuaSnip' --snippets
  use 'hrsh7th/cmp-buffer' -- ?
  use 'hrsh7th/cmp-nvim-lsp' --nvim-cmp source for nvims built in lsp
  use 'hrsh7th/nvim-cmp' -- completions
  use 'windwp/nvim-autopairs' -- () "" {}
  use 'windwp/nvim-ts-autotag' -- ?typescript?
  use 'norcalli/nvim-colorizer.lua' --hex codes are colored

  -- tailwind goes brr
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- use 'jose-elias-alvarez/null-ls.nvim' -- required for prettier.nvim
  -- use 'MunifTanjim/prettier.nvim'
  -- use 'mattn/emmet-vim'

  -- tabs inside neovim
  use 'akinsho/nvim-bufferline.lua'

  -- themes
  use 'shaunsingh/nord.nvim'
  use 'shaunsingh/nyoom.nvim'
  use 'folke/tokyonight.nvim'
end)
