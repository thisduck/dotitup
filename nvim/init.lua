vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- plugins.
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'rmehri01/onenord.nvim',
	  config = function()
		  require('onenord').setup()
	  end
  }

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	  config = function()
		  require('lualine').setup()
	  end
  }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	  config = function()
		  require'nvim-treesitter.configs'.setup {
			  auto_install = true,
			  highlight = {
				  enable = true,
			  }
		  }
	  end
  }
end)

