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

-- window.
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false

-- search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set('n', 'g/', '<cmd>nohlsearch<cr>')

-- sign column.
vim.opt.signcolumn = "yes"

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
			vim.cmd [[ highlight IncSearch gui=bold ]]
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup({})
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		requires = {
			"windwp/nvim-ts-autotag",
			"RRethy/nvim-treesitter-endwise",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"p00f/nvim-ts-rainbow",
		},
		config = function()
			require 'nvim-treesitter.configs'.setup {
				auto_install = true,
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				endwise = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
				},
				matchup = {
					enable = true,
				},
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

	use({
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = false,
					on_yank = false,
				},
			})

			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

			vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
			vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

			vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
		end
	})

	use({
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({
				on_substitute = function(event)
					require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV�]"))
				end,
			})

			vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
			vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
			vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
			vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

			vim.keymap.set("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
			vim.keymap.set("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
			vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
			vim.keymap.set("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
		end
	})

	use {
		"kana/vim-textobj-user",
		"kana/vim-textobj-entire",
		"michaeljsmith/vim-indent-object",
		"beloglazov/vim-textobj-quotes",
		"coderifous/textobj-word-column.vim",
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = function()
				require("nvim-treesitter.configs").setup {
					textobjects = {
						select = {
							enable = true,
							lookahead = true,
							keymaps = {
								["af"] = "@function.outer",
								["if"] = "@function.inner",
								["aa"] = "@parameter.outer",
								["ia"] = "@parameter.inner",
							},
						},
					},
				}
			end,
		},
	}

	use "tpope/vim-surround"
	use "tpope/vim-repeat"

	use "troydm/zoomwintab.vim"

	use "chrisbra/nrrwrgn"

	use "tpope/vim-unimpaired"

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			local actions = require "telescope.actions"
			require 'telescope'.setup {
				defaults = require("telescope.themes").get_ivy {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
			}
			require("telescope").load_extension "fzf"

			vim.cmd [[
				nnoremap <leader>; <cmd>Telescope find_files<cr>
				nnoremap <leader>fg <cmd>Telescope live_grep<cr>
				nnoremap <leader>fb <cmd>Telescope oldfiles only_cwd=true include_current_session=true<cr>
				nnoremap <leader>fh <cmd>Telescope help_tags<cr>
				nnoremap <leader>/ <cmd>lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Search: ") })<cr>
				nnoremap K <cmd>Telescope grep_string<cr>
				nnoremap <leader>fr <cmd>Telescope resume<cr>
			]]

			vim.cmd [[ autocmd User TelescopePreviewerLoaded setlocal wrap ]]
		end
	}

	use {
		'mhinz/vim-startify',
		config = function()
			vim.cmd [[
				let g:startify_lists = [
					\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
					\ { 'type': 'sessions',  'header': ['   Sessions']       },
					\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
					\ { 'type': 'commands',  'header': ['   Commands']       },
					\ ]
			]]
		end
	}

	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>")
			vim.keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>")
		end,
	}

	use {
		"windwp/nvim-autopairs",
		config = function()
			require('nvim-autopairs').setup()
		end
	}

	use {
		"andymass/vim-matchup",
		config = function()
			vim.cmd [[nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>]]
		end,
	}

	use "tpope/vim-commentary"

	use {
		'junnplus/lsp-setup.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
		config = function()
			local servers = {
				pylsp = {},
				ansiblels = {},
				bashls = {},
				cssls = {},
				cucumber_language_server = {},
				dockerls = {},
				eslint = {
					formatting = true,
				},
				ember = {},
				emmet_ls = {},
				graphql = {},
				html = {},
				jsonls = {},
				tsserver = {
					formatting = false,
				},
				sumneko_lua = {
					formatting = false,
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				intelephense = {},
				perlnavigator = {},
				prismals = {},
				solargraph = {},
				remark_ls = {
					formatting = false,
				},
				rust_analyzer = {},
				sqlls = {},
				sorbet = {},
				svelte = {},
				taplo = {},
				tailwindcss = {},
				vimls = {},
				volar = {
					formatting = false,
				},
				yamlls = {},
			}
			require('lsp-setup').setup({
				default_mappings = false,
				mappings = {
					gD = "lua vim.lsp.buf.declaration()",
					gd = "Telescope lsp_definitions",
					gt = "Telescope lsp_type_definitions",
					gi = "Telescope lsp_implementations",
					gr = "Telescope lsp_references",
					L = "lua vim.lsp.buf.hover({ border = 'single'})",
					["<leader>sh"] = "lua vim.lsp.buf.signature_help()",
					["<Leader>rn"] = "lua vim.lsp.buf.rename()",
					["<Leader>ca"] = "lua vim.lsp.buf.code_action()",
					["<Leader>ff"] = "lua vim.lsp.buf.formatting()",
					["<Leader>fd"] = "lua vim.diagnostic.open_float()",
					["[d"] = 'lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})',
					["]d"] = 'lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})',
				},
				servers = servers,
				on_attach = function(client)
					local formatting = servers[client.name].formatting
					local formatting_is_empty = formatting == nil or formatting == ''
					if not formatting_is_empty then
						client.resolved_capabilities.document_formatting = formatting
						client.resolved_capabilities.document_range_formatting = formatting
					end
				end,
			})

			local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_format_augroup,
				callback = function()
					vim.lsp.buf.formatting_sync({}, 4000)
				end,
			})
		end
	}
end)
