vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = 'a'

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
end)
