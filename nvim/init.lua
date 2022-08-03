vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- indent.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.cmd [[set list listchars=tab:▸\ ,trail:·]]

-- peristent undo.
vim.opt.undofile = true

-- return to last position.
vim.cmd [[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]

-- esc.
vim.keymap.set('i', '<C-c>', '<Esc>')

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

	use 'simnalamburt/vim-mundo'

	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

			vim.keymap.set('', '<leader>w', '<cmd>HopWord<cr>')
			vim.keymap.set('', '<leader>j', '<cmd>HopLineStartAC<cr>')
			vim.keymap.set('', '<leader>k', '<cmd>HopLineStartBC<cr>')
			vim.keymap.set('', '<leader>e', "<cmd>lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>")
			vim.keymap.set('', ';', '<cmd>HopChar1<cr>')
		end
	}
end)

