vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins.
require("lazy").setup({
  {
    'rmehri01/onenord.nvim',
    config = function()
      require('onenord').setup()
    end
  },
  {
	  'nvim-lualine/lualine.nvim',
	  dependencies = { 'kyazdani42/nvim-web-devicons' },
	  config = function()
		  require('lualine').setup()
	  end
  },
  {
	  'nvim-treesitter/nvim-treesitter',
	  build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	  config = function()
		  require'nvim-treesitter.configs'.setup {
			  auto_install = true,
			  highlight = {
				  enable = true,
			  }
		  }
	  end
  }
})
