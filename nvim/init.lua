vim.g.mapleader = " "

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
vim.keymap.set("n", "g/", "<cmd>nohlsearch<cr>")

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

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup()
      vim.cmd [[ highlight IncSearch gui=bold ]]
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {}
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    requires = {
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-endwise",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
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
    end,
  }

  use {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup {}
    end,
  }

  use "simnalamburt/vim-mundo"

  use {
    "phaazon/hop.nvim",
    requires = { "thisduck/hop_extensions.nvim" },
    branch = "v2",
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
    end,
  }

  use "tversteeg/registers.nvim"

  use "machakann/vim-highlightedyank"

  use {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup {
        highlight = {
          on_put = false,
          on_yank = false,
        },
      }

      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
    end,
  }

  use {
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup {
        on_substitute = function(event)
          require("yanky").init_ring("p", event.register, event.count, event.vmode:match "[vV�]")
        end,
      }

      vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
      vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
      vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
      vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

      vim.keymap.set("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
      vim.keymap.set("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
      vim.keymap.set("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
      vim.keymap.set("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
    end,
  }

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
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
      { "nvim-lua/plenary.nvim" },
      use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      local actions = require "telescope.actions"
      require("telescope").setup {
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
    end,
  }

  use {
    "mhinz/vim-startify",
    config = function()
      vim.cmd [[
				let g:startify_lists = [
					\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
					\ { 'type': 'sessions',  'header': ['   Sessions']       },
					\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
					\ { 'type': 'commands',  'header': ['   Commands']       },
					\ ]
			]]
    end,
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
      require("nvim-autopairs").setup()
    end,
  }

  use {
    "andymass/vim-matchup",
    config = function()
      vim.cmd [[nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>]]
    end,
  }

  use "tpope/vim-commentary"

  use {
    "junnplus/lsp-setup.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      require("fidget").setup {}

      vim.diagnostic.config {
        virtual_text = {
          source = "always",
        },
        float = {
          source = "always",
          border = "rounded",
        },
      }

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
      require("lsp-setup").setup {
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
          local formatting_is_empty = formatting == nil or formatting == ""
          if not formatting_is_empty then
            client.resolved_capabilities.document_formatting = formatting
            client.resolved_capabilities.document_range_formatting = formatting
          end
        end,
      }

      local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_format_augroup,
        callback = function()
          vim.lsp.buf.formatting_sync({}, 4000)
        end,
      })
    end,
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      require("null-ls").setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd.with {
            filetypes = {
              "markdown",
            },
          },
        },
      }
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-rg",
      "quangnguyen30192/cmp-nvim-tags",
      "andersevenrud/cmp-tmux",
      "petertriho/cmp-git",

      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",

      "onsails/lspkind.nvim",
    },
    config = function()
      vim.cmd [[set completeopt=menu,menuone,noselect]]

      local cmp = require "cmp"
      if not cmp then
        return
      end

      local luasnip = require "luasnip"
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      cmp.setup {
        completion = {
          keyword_length = 3,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = string.format("[%s]", entry.source.name)
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm { select = true }
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 100 },
          { name = "luasnip", priority = 100, keyword_length = 2 },
          { name = "nvim_lsp_signature_help" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = "path" },
          { name = "tags" },
          { name = "treesitter" },
          { name = "rg", option = { pattern = [[[\w_-]{5,60}]] } },
          { name = "tmux", max_item_count = 10, option = { all_panes = true } },
        },
      }

      require("cmp_git").setup()
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources {
          { name = "git" },
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
          { name = "tags" },
          { name = "buffer" },
          { name = "rg", option = { pattern = [[[\w_-]{5,60}]] } },
        }),
      })

      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  }
end)
