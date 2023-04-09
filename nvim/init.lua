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
      vim.keymap.set('n', '<leader>/',
        [[<cmd>lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Search: ") })<cr>]],
        { desc = "Search word under cursor" })

      vim.cmd [[ autocmd User TelescopePreviewerLoaded setlocal wrap ]]
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
        lua_ls = {
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

          vim.keymap.set(
            "v",
            "<space>ca",
            vim.lsp.buf.range_code_action,
            { noremap = true, silent = true, buffer = bufnr }
          )
        end,
      })

      local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_format_augroup,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  },
})
