vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = 'a'

-- indent.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.cmd [[set list listchars=tab:▸\ ,trail:·]]

-- fold.
vim.o.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- persistent undo.
vim.opt.undofile = true

-- return to last file position.
vim.cmd [[
autocmd BufRead * autocmd FileType <buffer> ++once
  \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]

-- esc.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- plugins.
vim.cmd [[packadd packer.nvim]]

vim.cmd [[
augroup packer_user_config
  autocmd!
  autocmd User PackerComplete PackerCompile
  autocmd BufWritePost init.lua source <afile> | PackerInstall
augroup end
]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'rmehri01/onenord.nvim',
		config = function()
			require('onenord').setup()
			vim.cmd[[ highlight IncSearch gui=bold ]]
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

	use {
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup {}
		end,
	}

	use 'simnalamburt/vim-mundo'

	use {
		'phaazon/hop.nvim',
		requires = { "thisduck/hop_extensions.nvim" },
		branch = 'v2',
		config = function()
			require("hop").setup {
				keys = "etovxqpdygfblzhckisuran",
				extensions = {
					"hop_extensions.hint_char1",
				},
			}

			vim.keymap.set("", "<leader>w", "<cmd>HopWord<cr>")
			vim.keymap.set("", "<leader>j", "<cmd>HopLineStartAC<cr>")
			vim.keymap.set("", "<leader>k", "<cmd>HopLineStartBC<cr>")
			vim.keymap.set(
			"",
			"<leader>e",
			"<cmd>lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>"
			)
			vim.keymap.set("", ";", "<cmd>HopChar1NoLeadingSpaces<cr>")
		end
	}

	use "tversteeg/registers.nvim"

	use "machakann/vim-highlightedyank"
end)
