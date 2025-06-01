-- start of neovim config

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,trail:·"

-- fold.
vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- persistent undo.
vim.opt.undofile = true

-- disable swapfile.
vim.opt.swapfile = false

-- esc.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- yank/paste from system clipboard.
vim.keymap.set({ "n", "v" }, "<leader>cy", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>cp", '"+p')

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

-- per-project config.
vim.opt.exrc = true

-- ensure diffs are displayed vertically.
vim.cmd("set diffopt+=vertical,followwrap")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- plugins.
require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        highlight = {
          enable = true,
          -- ruby depends on regex highlighting for proper indenting.
          additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
        matchup = { enable = true },
      })
    end,
  },
  { "nmac427/guess-indent.nvim", config = true },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
        },
      })
    end,
  },
  "mbbill/undotree",
  "farmergreg/vim-lastplace",
  {
    "smoka7/hop.nvim",
    dependencies = {
      "thisduck/hop_extensions.nvim",
    },
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

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
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
      require("which-key").setup({
        delay = 800,
        win = {
          border = "single",
        },
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    config = true,
    keys = {
      { "y", "<Plug>(YankyYank)", desc = "Yank yank", mode = { "n", "x" } },

      { "p", "<Plug>(YankyPutAfter)", desc = "Yank put after", mode = { "n", "x" } },
      { "P", "<Plug>(YankyPutBefore)", desc = "Yank put before", mode = { "n", "x" } },
      { "gp", "<Plug>(YankyGPutAfter)", desc = "Yank global put after", mode = { "n", "x" } },
      { "gP", "<Plug>(YankyGPutBefore)", desc = "Yank global put before", mode = { "n", "x" } },

      { "<c-n>", "<Plug>(YankyCycleForward)", desc = "Yanky cycle forward" },
      { "<c-p>", "<Plug>(YankyCycleBackward)", desc = "Yanky cycle backward" },
    },
  },
  {
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup({
        on_substitute = require("yanky.integration").substitute(),
      })
    end,
    keys = {
      { "s", "<cmd>lua require('substitute').operator()<cr>", desc = "Substitute operator" },
      { "ss", "<cmd>lua require('substitute').line()<cr>", desc = "Substitute line" },
      { "S", "<cmd>lua require('substitute').eol()<cr>", desc = "Substitute end of line" },
      {
        "s",
        "<cmd>lua require('substitute').visual()<cr>",
        desc = "Substitute visual selection",
        mode = "x",
      },

      { "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", desc = "Exchange operator" },
      { "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", desc = "Exchange line" },
      {
        "X",
        "<cmd>lua require('substitute.exchange').visual()<cr>",
        desc = "Exchange visual selection",
        mode = "x",
      },
      { "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", desc = "Cancel exchange" },
    },
  },
  {
    {
      "kana/vim-textobj-user",
      dependencies = {
        "kana/vim-textobj-entire",
        "beloglazov/vim-textobj-quotes",
      },
    },
    "michaeljsmith/vim-indent-object",
    "coderifous/textobj-word-column.vim",
    { "echasnovski/mini.ai", config = true },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  "troydm/zoomwintab.vim",
  "chrisbra/nrrwrgn",
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        },
      })
    end,
  },
  { "tiagovla/scope.nvim", config = true },
  "tpope/vim-unimpaired",
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = require("telescope.themes").get_ivy({
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        }),
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
      })
      require("telescope").load_extension("fzf")

      vim.cmd([[ autocmd User TelescopePreviewerLoaded setlocal wrap ]])
    end,
    keys = {
      { "<leader>;", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files in project" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live search in project" },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").live_grep({
            search_dirs = { vim.fn.expand("%:p") },
          })
        end,
        desc = "Search in current file",
      },
      {
        "<leader>ffw",
        function()
          require("telescope.builtin").live_grep({
            search_dirs = { vim.fn.expand("%:p") },
            default_text = vim.fn.expand("<cword>"),
          })
        end,
        desc = "Search for word under cursor in current file",
      },
      {
        "<leader>fb",
        "<cmd>Telescope oldfiles only_cwd=true include_current_session=true<cr>",
        desc = "Recent files and buffers in current project",
      },
      { "<leader>fa", "<cmd>Telescope oldfiles include_current_session=true<cr>", desc = "Recent files and buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
      { "K", "<cmd>Telescope grep_string<cr>", desc = "Search word under cursor" },
      {
        "<leader>/",
        function()
          require("telescope.builtin").grep_string({
            search = vim.fn.input("Search: "),
          })
        end,
        desc = "Search in project",
      },
      {
        "<leader>/",
        function()
          local old_reg = vim.fn.getreg("v")
          vim.cmd('normal! "vy')
          local text = vim.fn.getreg("v")
          vim.fn.setreg("v", old_reg)

          require("telescope.builtin").grep_string({
            search = text,
          })
        end,
        mode = "v",
        desc = "Search in project (via visual selection)",
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({
        keymaps = {
          openNextLocation = { n = "<C-j>" },
          openPrevLocation = { n = "<C-k>" },
        },
      })
    end,
  },
  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = { ".git", "Makefile", "*.sln", "build/env.sh" }
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
    keys = {
      {
        "<leader>qs",
        "<cmd>lua require('persistence').load()<cr>",
        desc = "Restore session for current directory",
      },
      { "<leader>ql", "<cmd>lua require('persistence').load({ last = true })<cr>", desc = "Restore last session" },
      { "<leader>qd", "<cmd>lua require('persistence').stop()<cr>", desc = "Stop Persistence" },
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "ozthemagician/alpha-cowsays-nvim",
    },
    config = function()
      local startify = require("alpha.themes.startify")
      local cow = require("alpha-cowsays-nvim")

      startify.section.header.val = cow.cowsays()

      require("alpha").setup(startify.config)

      -- close alpha when a new window is opened
      vim.api.nvim_create_autocmd("WinEnter", {
        pattern = "*",
        callback = function()
          if vim.bo.filetype == "alpha" then
            vim.cmd("Alpha")
          end
        end,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      { "s1n7ax/nvim-window-picker", opts = {} },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- show hidden files by default
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
      { "<leader>nf", "<cmd>Neotree filesystem reveal left<cr>", desc = "File tree for filesystem" },
    },
  },
  "jghauser/mkdir.nvim",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html",
          "xml",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
        },
      })
    end,
  },
  "RRethy/nvim-treesitter-endwise",
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    keys = {
      { "<C-k>", "<cmd>MatchupWhereAmI?<cr>", desc = "Show current match" },
    },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  {
    "junnplus/lsp-setup.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          source = "always",
        },
        float = {
          source = "always",
          border = "rounded",
        },
      })

      require("lsp-setup").setup({
        default_mappings = false,
        mappings = {
          gD = "<cmd>lua vim.lsp.buf.declaration()<cr>",
          gd = "<cmd>Telescope lsp_definitions<cr>",
          gt = "<cmd>Telescope lsp_type_definitions<cr>",
          gi = "<cmd>Telescope lsp_implementations<cr>",
          gr = "<cmd>Telescope lsp_references<cr>",
          L = "<cmd>lua vim.lsp.buf.hover({ border = 'single'})<cr>",
          ["<leader>sh"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
          ["<leader>rn"] = "<cmd>lua vim.lsp.buf.rename()<cr>",
          ["<leader>ca"] = "<cmd>lua vim.lsp.buf.code_action()<cr>",
          ["<leader>fd"] = "<cmd>lua vim.diagnostic.open_float()<cr>",
          ["[d"] = {
            cmd = function()
              vim.diagnostic.jump({ count = -1, float = true })
            end,
            opts = { desc = "Prev Diagnostic" },
          },
          ["]d"] = {
            cmd = function()
              vim.diagnostic.jump({ count = 1, float = true })
            end,
            opts = { desc = "Next Diagnostic" },
          },
        },
        on_attach = function(client)
          local disable_formatting = {
            "ts_ls",
            "vue_ls",
          }

          local enable_formatting = {
            "eslint",
          }

          for _, server in ipairs(disable_formatting) do
            if client.name == server then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end

          for _, server in ipairs(enable_formatting) do
            if client.name == server then
              client.server_capabilities.documentFormattingProvider = true
              client.server_capabilities.documentRangeFormattingProvider = true
            end
          end
        end,
        servers = {
          pylsp = {},
          ansiblels = {},
          awk_ls = {},
          bashls = {},
          clangd = {},
          cssls = {},
          cucumber_language_server = {},
          docker_compose_language_service = {},
          dockerls = {},
          eslint = {},
          graphql = {},
          html = {},
          jsonls = {},
          ts_ls = {
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = "",
                  languages = { "javascript", "typescript", "vue" },
                },
              },
            },
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "vue",
            },
          },
          lua_ls = {
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                workspace = { checkThirdParty = false },
                diagnostics = { globals = { "vim" } },
              },
            },
          },
          intelephense = {},
          kulala_ls = {},
          perlnavigator = {},
          prismals = {},
          solargraph = {},
          rust_analyzer = {},
          sqls = {},
          svelte = {},
          tailwindcss = {},
          vimls = {},
          vue_ls = {},
          yamlls = {
            settings = {
              yaml = {
                keyOrdering = false,
              },
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "zapling/mason-conform.nvim",
    },
    config = function()
      vim.g.local_auto_format = true
      vim.api.nvim_create_user_command("AutoFormatDisable", function()
        vim.g.local_auto_format = false
      end, { nargs = 0 })
      vim.api.nvim_create_user_command("AutoFormatEnable", function()
        vim.g.local_auto_format = true
      end, { nargs = 0 })

      require("conform").setup({
        format_on_save = function()
          if vim.g.local_auto_format then
            return {
              lsp_format = "fallback",
              timeout_ms = 500,
            }
          end
          return nil
        end,
        formatters_by_ft = {
          lua = { "stylua" },
          ruby = { "rubocop" },
          markdown = { "prettier" },
          sql = { "sqlfmt" },
        },
      })
    end,
    keys = {
      {
        "<leader>fo",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format buffer",
      },
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({
        presets = {
          long_message_to_split = true,
        },
      })

      vim.api.nvim_set_hl(0, "NoiceVirtualText", { fg = "#b0b0b0", bg = "NONE" })

      require("telescope").load_extension("noice")
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
      "petertriho/cmp-git",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
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
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp_all_buffers = {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
      }

      local pattern = [[[\w_-]{5,60}]]

      local cmp_rg = { name = "rg", option = { pattern = pattern, additional_arguments = "--hidden" } }

      cmp.setup({
        performance = {
          max_view_entries = 15,
        },
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
          { name = "nvim_lsp", priority = 100 },
          { name = "luasnip", priority = 100 },
          { name = "nvim_lsp_signature_help" },
          cmp_all_buffers,
          { name = "path" },
          { name = "tags" },
          { name = "treesitter" },
          cmp_rg,
        }),
      })

      require("cmp_git").setup()
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
          cmp_all_buffers,
          cmp_rg,
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
          { name = "cmdline", priority = 100 },
          { name = "tags" },
          cmp_all_buffers,
          cmp_rg,
        }),
      })

      cmp.setup.cmdline("@", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "tags" },
          cmp_all_buffers,
          cmp_rg,
        }),
      })

      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "linrongbin16/gentags.nvim",
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        filetypes = {
          yaml = true,
          markdown = true,
          gitcommit = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-f>",
            accept_word = "<C-o>",
            accept_line = "<C-l>",
            next = "<C-h>",
            prev = "<C-m>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end, { desc = "Next git change" })

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end, { desc = "Previous git change" })

          -- Actions
          map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
          map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Stage hunk" })
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Reset hunk" })
          map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
          map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
          map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end, { desc = "Blame current line" })
          map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff current buffer" })
          map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
          end, { desc = "Diff current buffer with HEAD" })
          map("n", "<leader>hQ", function()
            gitsigns.setqflist("all")
          end, { desc = "Set quickfix list with all hunks in all files" })
          map("n", "<leader>hq", gitsigns.setqflist, { desc = "Set quickfix list with current hunk" })
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame for current line" })
          map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
          -- Text object
          map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
        end,
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
    },
    keys = {
      {
        "<Leader>gs",
        function()
          -- collect all fugitive windows
          local fugitive_windows = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_get_name(buf):match("^fugitive:") then
              table.insert(fugitive_windows, win)
            end
          end

          if #fugitive_windows > 0 then
            for _, win in ipairs(fugitive_windows) do
              vim.api.nvim_win_close(win, true)
            end
          else
            -- close current window if it's alpha
            if vim.bo.filetype == "alpha" then
              vim.cmd("Alpha")
            end
            vim.cmd("15split | 0Git")
          end
        end,
        silent = true,
        desc = "Toggle Git status",
      },
      { "<Leader>gl", ":Gclog %<CR>", silent = true, desc = "Git log" },
      { "<Leader>gl", ":Gclog<CR>", silent = true, desc = "Git log", mode = "v" },
      { "<Leader>gb", ":Git blame<CR>", silent = true, desc = "Git blame" },
    },
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          advanced_git_search = {
            diff_plugin = "fugitive",
            git_flags = {},
            git_diff_flags = {},
            show_builtin_git_pickers = false,
          },
        },
      })

      require("telescope").load_extension("advanced_git_search")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      {
        "jk",
        "<C-\\><C-n>",
        mode = "t",
        desc = "Exit terminal insert mode",
      },
      {
        "<C-w>k",
        "<C-\\><C-n><C-w>k",
        mode = "t",
        desc = "Move to terminal window above",
      },
      {
        "<C-t>",
        function()
          vim.cmd(vim.v.count1 .. "ToggleTerm")
        end,
        mode = "n",
        desc = "Toggle terminal",
      },
      {
        "<C-t>",
        function()
          vim.cmd(vim.v.count1 .. "ToggleTerm")
        end,
        mode = "i",
        desc = "Toggle terminal",
      },
      {
        "<C-t>",
        function()
          vim.cmd(vim.v.count1 .. "ToggleTerm")
        end,
        mode = "t",
        desc = "Toggle terminal",
      },
    },
  },
  {
    "johmsalas/text-case.nvim",
    config = true,
    keys = {
      {
        "gas",
        function()
          require("textcase").current_word("to_snake_case")
        end,
        desc = "Convert word to snake_case",
      },
      {
        "gad",
        function()
          require("textcase").current_word("to_dash_case")
        end,
        desc = "Convert word to dash-case",
      },
      {
        "gac",
        function()
          require("textcase").current_word("to_camel_case")
        end,
        desc = "Convert word to camelCase",
      },
      {
        "gaS",
        function()
          require("textcase").lsp_rename("to_snake_case")
        end,
        desc = "LSP rename to snake_case",
      },
      {
        "gaD",
        function()
          require("textcase").lsp_rename("to_dash_case")
        end,
        desc = "LSP rename to dash-case",
      },
      {
        "gaC",
        function()
          require("textcase").lsp_rename("to_camel_case")
        end,
        desc = "LSP rename to camelCase",
      },
    },
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
      -- For use default preset and it work with dot
      vim.keymap.set("n", "g,", require("treesj").split)
      vim.keymap.set("n", "gJ", require("treesj").join)
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        "<leader>da",
        mode = { "n", "x" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "<leader>ds",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
    },
  },
  {
    "chrisgrieser/nvim-rulebook",
    config = true,
    keys = {
      {
        "<leader>ri",
        function()
          require("rulebook").ignoreRule()
        end,
        desc = "Ignore rule",
      },
      {
        "<leader>rl",
        function()
          require("rulebook").lookupRule()
        end,
        desc = "Lookup rule",
      },
    },
  },
  {
    "artemave/workspace-diagnostics.nvim",
    keys = {
      {
        "<leader>xd",
        function()
          for _, client in ipairs(vim.lsp.buf_get_clients()) do
            require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
          end
        end,
        desc = "Populate workspace diagnostics",
      },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
        config = function()
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
              require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
            end,
          })
        end,
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      {
        "<leader>rs",
        function()
          require("kulala").run()
        end,
        mode = { "n", "v" },
        desc = "Send request",
      },
      {
        "<leader>ra",
        function()
          require("kulala").run_all()
        end,
        mode = { "n", "v" },
        ft = "http",
        desc = "Send all requests",
      },
      {
        "<leader>rr",
        function()
          require("kulala").replay()
        end,
        ft = { "http", "rest" },
        desc = "Replay the last request",
      },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = false,
    },
  },
  "bogado/file-line",
  { "mistricky/codesnap.nvim", build = "make" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = { "chrome", "js" },
      })
    end,
  },
  "tpope/vim-rails",
  "vim-ruby/vim-ruby",
  "itchyny/vim-qfedit",
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("bqf").setup({
        preview = {
          auto_preview = false,
        },
      })
    end,
  },
})
