vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.mouse = "a"

-- indent.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.cmd [[set list listchars=tab:▸\ ,trail:·]]

-- fold.
vim.o.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- persistent undo.
vim.opt.undofile = true

-- disable swapfile.
vim.opt.swapfile = false

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
vim.cmd "set diffopt+=vertical,followwrap"

-- search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set('n', 'g/', '<cmd>nohlsearch<cr>')

-- sign column.
vim.opt.signcolumn = "yes"

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
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      "SmiteshP/nvim-navic",
    },
    config = function()
      local navic = require("nvim-navic")
      require('lualine').setup({
        sections = {
          lualine_x = { 'encoding', 'fileformat', 'filetype', 'filename' },
          lualine_c = {
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end
            },
          }
        }
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    dependencies = {
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
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup {}
    end,
  },
  'simnalamburt/vim-mundo',
  {
    'phaazon/hop.nvim',
    dependencies = { "thisduck/hop_extensions.nvim" },
    branch = 'v2',
    config = function()
      require("hop").setup {
        keys = "etovxqpdygfblzhckisuran",
        extensions = {
          "hop_extensions.hint_char1",
        },
      }

      vim.keymap.set("", "<leader>w", "<cmd>HopWord<cr>", { desc = "Hop word" })
      vim.keymap.set("", "<leader>j", "<cmd>HopLineStartAC<cr>", { desc = "Hop line (below cursor)" })
      vim.keymap.set("", "<leader>k", "<cmd>HopLineStartBC<cr>", { desc = "Hop line (above cursor)" })
      vim.keymap.set(
        "",
        "<leader>e",
        "<cmd>lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
        { desc = "Hop word (end of word)" }
      )
      vim.keymap.set("", ";", "<cmd>HopChar1Start<cr>", { desc = "Hop char" })
    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  },
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})

      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
    end
  },
  {
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
  },
  {
    {
      "kana/vim-textobj-user",
      dependencies = {
        "kana/vim-textobj-entire",
        "beloglazov/vim-textobj-quotes",
      }
    },
    "michaeljsmith/vim-indent-object",
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
  },
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "troydm/zoomwintab.vim",
  "chrisbra/nrrwrgn",
  "tpope/vim-unimpaired",
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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

      vim.keymap.set('n', '<leader>;', [[<cmd>Telescope find_files<cr>]], { desc = "Find files in project" })
      vim.keymap.set('n', '<leader>fg', [[<cmd>Telescope live_grep<cr> ]], { desc = "Live search in project" })
      vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],
        { desc = "Search in current file" })
      vim.keymap.set('n', '<leader>fb', [[<cmd>Telescope oldfiles only_cwd=true include_current_session=true<cr>]],
        { desc = "Recent files and buffers" })
      vim.keymap.set('n', '<leader>fh', [[<cmd>Telescope help_tags<cr>]], { desc = "Help tags" })
      vim.keymap.set('n', '<leader>fr', [[<cmd>Telescope resume<cr>]], { desc = "Resume last search" })
      vim.keymap.set('n', 'K', [[<cmd>Telescope grep_string<cr>]], { desc = "Search word under cursor" })
      vim.keymap.set('n', '<leader>/', [[:Search<space>]], { desc = "Search in project" })

      vim.cmd [[ autocmd User TelescopePreviewerLoaded setlocal wrap ]]

      vim.api.nvim_create_user_command("Search", function(opts)
        require("telescope.builtin").grep_string { search = opts.args }
      end, { nargs = 1 })
    end
  },
  {
    "airblade/vim-rooter",
    config = function()
      vim.cmd [[ let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] ]]
    end,
  },
  {
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup()
      -- restore the session for the current directory
      vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]],
        { desc = "Restore session for current directory" })

      -- restore the last session
      vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]],
        { desc = "Restore last session" })

      -- stop Persistence => session won't be saved on exit
      vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], { desc = "Stop Persistence" })
    end,
  },
  {
    'mhinz/vim-startify',
    config = function()
      vim.g.startify_session_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/")

      vim.cmd [[
      let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
      ]]
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>nf", "<cmd>Neotree filesystem reveal left<cr>", { desc = "File tree for filesystem" })
    end
  },
  'jghauser/mkdir.nvim',
  {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    -- "andymass/vim-matchup",
    "thisduck/vim-matchup",
    config = function()
      vim.cmd [[nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>]]
    end,
  },
  "tpope/vim-commentary",
  {
    'junnplus/lsp-setup.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'SmiteshP/nvim-navic',
    },
    config = function()
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
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
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
          gD = "<cmd>lua vim.lsp.buf.declaration()<cr>",
          gd = "<cmd>Telescope lsp_definitions<cr>",
          gt = "<cmd>Telescope lsp_type_definitions<cr>",
          gi = "<cmd>Telescope lsp_implementations<cr>",
          gr = "<cmd>Telescope lsp_references<cr>",
          L = "<cmd>lua vim.lsp.buf.hover({ border = 'single'})<cr>",
          ["<leader>sh"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
          ["<Leader>rn"] = "<cmd>lua vim.lsp.buf.rename()<cr>",
          ["<Leader>ca"] = "<cmd>lua vim.lsp.buf.code_action()<cr>",
          ["<Leader>fo"] = "<cmd>lua vim.lsp.buf.format()<cr>",
          ["<Leader>fd"] = "<cmd>lua vim.diagnostic.open_float()<cr>",
          ["[d"] = '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<cr>',
          ["]d"] = '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<cr>',
        },
        servers = servers,
        on_attach = function(client, bufnr)
          local formatting = servers[client.name].formatting
          local formatting_is_empty = formatting == nil or formatting == ""

          if not formatting_is_empty then
            client.server_capabilities.documentFormattingProvider = formatting
            client.server_capabilities.documentRangeFormattingProvider = formatting
          end

          local navic = require("nvim-navic")
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end

          if vim.lsp.buf.range_code_action then
            vim.keymap.set(
              "v",
              "<space>ca",
              vim.lsp.buf.range_code_action,
              { noremap = true, silent = true, buffer = bufnr }
            )
          end
        end,
      })

      local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_format_augroup,
        callback = function()
          vim.lsp.buf.format({ timeout_ms = 6000 })
        end,
      })
    end
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        messages = {
          enabled = false,
        },
        notify = {
          enabled = false,
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      require("null-ls").setup {
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.formatting.prettierd.with {
            filetypes = {
              "markdown",
            },
          },
        },
      }
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
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
      {
        "zbirenbaum/copilot.lua",
        config = function()
          require("copilot").setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              debounce = 75,
              keymap = {
                accept = "<C-l>",
                accept_word = false,
                accept_line = false,
                next = "<C-;>",
                prev = "<C-h>",
                dismiss = "<C-]>",
              },
            },
          })
        end,
      },
      { "zbirenbaum/copilot-cmp", after = { "copilot.lua" }, opts = {} },
    },
    config = function()
      vim.cmd([[set completeopt=menu,menuone,noselect]])

      local cmp = require("cmp")
      if not cmp then
        return
      end

      local luasnip = require("luasnip")
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        completion = {
          keyword_length = 2,
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
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
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
        }),
        sources = cmp.config.sources({
          { name = "copilot",                priority = 99 },
          { name = "nvim_lsp",               priority = 100 },
          { name = "luasnip",                priority = 100 },
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
          { name = "rg",        option = { pattern = [[[\w_-]{5,60}]] } },
          {
            name = "tmux",
            option = {
              all_panes = true,
              keyword_pattern = [[[\w_-]{5,60}]]
            }
          },
        }),
      })

      require("cmp_git").setup()
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        }),
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
          { name = "rg",     option = { pattern = [[[\w_-]{5,60}]] } },
        }),
      })

      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis "~"
          end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<Leader>gs", ":10split<Bar>0Git<CR>", { silent = true, desc = "Git status" })
      vim.keymap.set("n", "<Leader>gl", ":Gclog %<CR>", { silent = true, desc = "Git log" })
      vim.keymap.set("v", "<Leader>gl", ":Gclog<CR>", { silent = true, desc = "Git log" })
      vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", { silent = true, desc = "Git blame" })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup { open_mapping = [[<c-t>]] }

      vim.cmd [[tnoremap <silent>jk <C-\><C-n>]]
      vim.cmd [[nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
      vim.cmd [[inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]]
    end,
  },
  {
    "johmsalas/text-case.nvim",
    config = function()
      require("textcase").setup({
        vim.cmd([[
        nnoremap gau :lua require('textcase').current_word('to_upper_case')<CR>
        nnoremap gal :lua require('textcase').current_word('to_lower_case')<CR>
        nnoremap gas :lua require('textcase').current_word('to_snake_case')<CR>
        nnoremap gad :lua require('textcase').current_word('to_dash_case')<CR>
        nnoremap gan :lua require('textcase').current_word('to_constant_case')<CR>
        nnoremap gad :lua require('textcase').current_word('to_dot_case')<CR>
        nnoremap gaa :lua require('textcase').current_word('to_phrase_case')<CR>
        nnoremap gac :lua require('textcase').current_word('to_camel_case')<CR>
        nnoremap gap :lua require('textcase').current_word('to_pascal_case')<CR>
        nnoremap gat :lua require('textcase').current_word('to_title_case')<CR>
        nnoremap gaf :lua require('textcase').current_word('to_path_case')<CR>

        nnoremap gaU :lua require('textcase').lsp_rename('to_upper_case')<CR>
        nnoremap gaL :lua require('textcase').lsp_rename('to_lower_case')<CR>
        nnoremap gaS :lua require('textcase').lsp_rename('to_snake_case')<CR>
        nnoremap gaD :lua require('textcase').lsp_rename('to_dash_case')<CR>
        nnoremap gaN :lua require('textcase').lsp_rename('to_constant_case')<CR>
        nnoremap gaD :lua require('textcase').lsp_rename('to_dot_case')<CR>
        nnoremap gaA :lua require('textcase').lsp_rename('to_phrase_case')<CR>
        nnoremap gaC :lua require('textcase').lsp_rename('to_camel_case')<CR>
        nnoremap gaP :lua require('textcase').lsp_rename('to_pascal_case')<CR>
        nnoremap gaT :lua require('textcase').lsp_rename('to_title_case')<CR>
        nnoremap gaF :lua require('textcase').lsp_rename('to_path_case')<CR>

        nnoremap geu :lua require('textcase').operator('to_upper_case')<CR>
        nnoremap gel :lua require('textcase').operator('to_lower_case')<CR>
        nnoremap ges :lua require('textcase').operator('to_snake_case')<CR>
        nnoremap ged :lua require('textcase').operator('to_dash_case')<CR>
        nnoremap gen :lua require('textcase').operator('to_constant_case')<CR>
        nnoremap ged :lua require('textcase').operator('to_dot_case')<CR>
        nnoremap gea :lua require('textcase').operator('to_phrase_case')<CR>
        nnoremap gec :lua require('textcase').operator('to_camel_case')<CR>
        nnoremap gep :lua require('textcase').operator('to_pascal_case')<CR>
        nnoremap get :lua require('textcase').operator('to_title_case')<CR>
        nnoremap gef :lua require('textcase').operator('to_path_case')<CR>
        ]]),
      })
    end,
  },
  {
    'bennypowers/splitjoin.nvim',
    lazy = true,
    keys = {
      { 'gj', function() require 'splitjoin'.join() end,  desc = 'Join the object under cursor' },
      { 'g,', function() require 'splitjoin'.split() end, desc = 'Split the object under cursor' },
    },
  },
})
