vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- plugins.
vim.cmd [[packadd packer.nvim]]
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
end)
