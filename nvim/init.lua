function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

-- leader settings.
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- visual.
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.termguicolors = true
vim.cmd [[set list listchars=tab:▸\ ,trail:·]]

-- mouse.
vim.opt.mouse = "a"

-- search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd "nnoremap g/ :nohlsearch<CR>"

vim.opt.inccommand = "nosplit"

-- windows/buffers.
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.equalalways = false
vim.cmd "set diffopt+=vertical"

-- indenting.
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- persistent undo.
vim.cmd "silent !mkdir ~/.vim_undo > /dev/null 2>&1"
vim.opt.undodir = vim.fn.stdpath "data" .. "/vim_undo"
vim.opt.undofile = true

-- swp files.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- timeouts.
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 300
vim.opt.updatetime = 250

-- return to the last file location.
vim.cmd [[autocmd BufRead * autocmd FileType <buffer> ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]

-- plugins
vim.cmd [[packadd packer.nvim]]

-- Shortcut for sourcing and running packer.
vim.cmd [[nnoremap <Leader>i <cmd>source ~/.config/nvim/init.lua <bar> PackerSync<CR>]]

local packer = require "packer"

packer.init {
  max_jobs = 50,
}

packer.startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use { "nvim-lua/plenary.nvim" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "maintained",
        sync_install = false,
        highlight = {
          enable = true,
        },
      }
    end,
  }
  use "nvim-treesitter/playground"

  -- visuals.
  -- use {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     vim.cmd "colorscheme onedark"
  --   end,
  -- }

  use {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup {
        custom_highlights = {
          MatchParen = { bg = "#52525b" },
        },
      }
      vim.cmd [[highlight clear MatchParenCur]]
      vim.cmd [[highlight link MatchParenCur CursorLine]]
    end,
  }

  -- use {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     local nightfox = require "nightfox"
  --
  --     nightfox.setup {
  --       fox = "nightfox",
  --       colors = { comment = "#a1a1aa" },
  --       inverse = {
  --         match_paren = true,
  --       },
  --       hlgroups = {
  --         String = { fg = "${yellow_br}" },
  --         TSURI = { fg = "${yellow_br}" },
  --         TSProperty = { fg = "${yellow_dm}" },
  --         TSMethod = { fg = "${blue_br}" },
  --         TSTag = { fg = "${magenta}" },
  --         TSKeywordReturn = { fg = "${red}" },
  --         HopUnmatched = { fg = "#4b5563", style = "bold" },
  --         HopNextKey = { fg = "#a5f3fc", style = "bold" },
  --         HopNextKey1 = { fg = "#f87171", style = "bold" },
  --         HopNextKey2 = { fg = "#fca5a5", style = "bold" },
  --       },
  --     }
  --
  --     nightfox.load()
  --   end,
  -- }

  use {
    "edkolev/tmuxline.vim",
    -- config = function()
    --   vim.cmd [[Tmuxline vim_statusline_3]]
    -- end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { { "kyazdani42/nvim-web-devicons", opt = true }, use "arkav/lualine-lsp-progress" },
    config = function()
      local gps = require "nvim-gps"
      local theme = require "lualine.themes.onenord"
      theme.inactive.a.fg = "#a1a1aa"
      theme.inactive.b.fg = "#a1a1aa"
      theme.inactive.c.fg = "#a1a1aa"
      theme.inactive.a.bg = "#3f3f46"
      theme.inactive.b.bg = "#3f3f46"
      theme.inactive.c.bg = "#3f3f46"
      require("lualine").setup {
        options = {
          theme = theme,
        },
        sections = {
          lualine_c = { "filename", "lsp_progress", { gps.get_location, cond = gps.is_available } },
        },
        extensions = { "quickfix", "nerdtree", "fugitive", "symbols-outline" },
      }
    end,
  }

  -- project.

  use {
    "mhinz/vim-startify",
    config = function()
      vim.cmd [[let g:startify_change_to_vcs_root = 1]]
      vim.g["startify_session_dir"] = vim.fn.stdpath "data" .. "/sessions"
      vim.cmd [[let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ] ]]
      vim.cmd [[ let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ] ]]
      vim.cmd [[ let g:startify_session_persistence = 1 ]]
      -- vim.cmd [[
      --   function! GetUniqueSessionName()
      --     let path = fnamemodify(getcwd(), ':~:t')
      --     let path = empty(path) ? 'no-project' : path
      --     return substitute(path, '/', '-', 'g')
      --   endfunction
      --   autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()
      -- ]]
    end,
  }

  use {
    "airblade/vim-rooter",
    config = function()
      vim.cmd [[ let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] ]]
    end,
  }

  -- motion.
  use {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup {
        extensions = { "dotfiles.hop-extensions" },
        keys = "asdghklqwer;'uiopzcvnmfj",
      }

      vim.cmd [[map ; <cmd>lua require('dotfiles.hop-extensions').hint_char1()<CR>]]
      vim.cmd [[map <Leader>w <cmd>HopWord<CR>]]
      vim.cmd [[map <Leader>e <cmd>lua require('dotfiles.hop-extensions').hint_end_of_word()<CR>]]
      vim.cmd [[map <Leader>j <cmd>HopLineStartAC<CR>]]
      vim.cmd [[map <Leader>k <cmd>HopLineStartBC<CR>]]
    end,
  }

  use {
    "mfussenegger/nvim-ts-hint-textobject",
    config = function()
      vim.cmd [[nnoremap <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
      vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
    end,
  }

  -- IDE.
  use {
    "simnalamburt/vim-mundo",
    config = function()
      vim.cmd [[nnoremap <Leader>u :MundoToggle<CR>]]
    end,
  }
  -- use "tomtom/tcomment_vim"
  use "tpope/vim-commentary"
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
        },
      }
    end,
  }

  use "rstacruz/vim-closer"
  use {
    "andymass/vim-matchup",
    config = function()
      vim.cmd [[nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>]]
      vim.cmd [[highlight clear MatchParenCur]]
      vim.cmd [[highlight link MatchParenCur CursorLine]]
      vim.cmd [[highlight MatchParen guibg=#1c1c1c]]
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      vim.cmd [[let g:toggleterm_terminal_mapping = '<C-t>']]
      vim.cmd [[tnoremap <silent>jk <C-\><C-n>]]
      vim.cmd [[nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
      vim.cmd [[inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]]
    end,
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  }

  -- Copy/Paste.
  use {
    "machakann/vim-highlightedyank",
    config = function()
      vim.cmd [[let g:highlightedyank_highlight_duration = 600]]
    end,
  }

  use {
    "svermeulen/vim-yoink",
    config = function()
      vim.cmd [[nmap <c-n> <plug>(YoinkPostPasteSwapBack)]]
      -- vim.cmd [[nmap <c-p> <plug>(YoinkPostPasteSwapForward)]]
      vim.cmd [[nmap p <plug>(YoinkPaste_p)]]
      vim.cmd [[nmap P <plug>(YoinkPaste_P)]]
      vim.cmd [[nmap y <plug>(YoinkYankPreserveCursorPosition)]]
      vim.cmd [[xmap y <plug>(YoinkYankPreserveCursorPosition)]]
    end,
  }

  use {
    "svermeulen/vim-subversive",
    config = function()
      vim.cmd [[nmap s <plug>(SubversiveSubstitute)]]
      vim.cmd [[nmap ss <plug>(SubversiveSubstituteLine)]]
      vim.cmd [[nmap S <plug>(SubversiveSubstituteToEndOfLine)]]
      vim.cmd [[xmap s <plug>(SubversiveSubstitute)]]
      vim.cmd [[xmap p <plug>(SubversiveSubstitute)]]
      vim.cmd [[xmap P <plug>(SubversiveSubstitute)]]
      vim.cmd [[nmap <leader>s <plug>(SubversiveSubstituteRange)]]
      vim.cmd [[xmap <leader>s <plug>(SubversiveSubstituteRange)]]
      vim.cmd [[nmap <leader>ss <plug>(SubversiveSubstituteWordRange)]]
      vim.cmd [[nmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)]]
      vim.cmd [[xmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)]]
      vim.cmd [[nmap <leader>rr <plug>(SubversiveSubstituteWordRangeNoPrompt)]]
    end,
  }

  -- text objects.
  use {
    "kana/vim-textobj-user",
    "kana/vim-textobj-entire",
    "kana/vim-textobj-fold",
    "kana/vim-textobj-function",
    "kana/vim-textobj-lastpat",
    "kana/vim-textobj-line",
    "michaeljsmith/vim-indent-object",
    "beloglazov/vim-textobj-quotes",
    "coderifous/textobj-word-column.vim",
    "Julian/vim-textobj-variable-segment",
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
              },
            },
          },
        }
      end,
    },
  }

  -- improvements.

  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"

  -- search and navigation.

  use {
    "preservim/nerdtree",
    config = function()
      vim.cmd [[map <Leader>nt :NERDTreeToggle<CR>]]
      vim.cmd [[map <Leader>nf :NERDTreeFind<CR>]]
      vim.cmd [[let NERDTreeShowHidden=1]]
    end,
  }

  -- git.

  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      vim.cmd [[nnoremap <silent> <Leader>dv :DiffviewOpen<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>df :DiffviewFileHistory<CR>]]
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            vim.api.nvim_buf_set_keymap(bufnr, mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
          map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

          -- Actions
          map("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>")
          map("v", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>")
          map("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>")
          map("v", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>")
          map("n", "<leader>hS", "<cmd>lua require('gitsigns').stage_buffer()<CR>")
          map("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>")
          map("n", "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<CR>")
          map("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<CR>")
        end,
      }
    end,
  }
  use "Xuyuanp/nerdtree-git-plugin"

  use "tpope/vim-rhubarb"
  use "tpope/vim-git"
  use {
    "tpope/vim-fugitive",
    config = function()
      vim.cmd [[nnoremap <silent> <Leader>gs :10split<Bar>0Git<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gd :Gvdiff<CR> " always split vertically]]
      vim.cmd [[nnoremap <silent> <Leader>gc :Git commit<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gb :Git blame<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gl :Gclog %<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gp :Git push<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>gw :Gwrite<CR> " adds the current file]]
      vim.cmd [[nnoremap <silent> <Leader>ga :Gwrite<CR> " to make it feel like git add]]
      vim.cmd [[nnoremap <silent> <Leader>grm :Gdelete!<CR>]]

      vim.cmd [[nnoremap <silent> <Leader>dg :diffget<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>dp :diffput<CR>]]
    end,
  }

  -- tags
  use {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]
    end,
  }

  -- search.
  use "haya14busa/is.vim"

  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      vim.cmd [[nnoremap <Leader>/ :lua require('telescope.builtin').grep_string({ search = vim.fn.input("> ")})<CR>]]
      vim.cmd [[nnoremap <Leader><tab> <cmd>lua require('telescope.builtin').keymaps()<cr>]]
      vim.cmd [[nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>]]
      vim.cmd [[nnoremap <Leader>bs :lua require('telescope.builtin').buffers()<CR>]]
      vim.cmd [[nnoremap <Leader>he :lua require('telescope.builtin').help_tags()<CR>]]
      vim.cmd [[nnoremap <silent>K <cmd>lua require('telescope.builtin').grep_string()<cr>]]
      require "dotfiles.telescope"
    end,
  }
  use "nvim-telescope/telescope-fzy-native.nvim"

  -- language/framework support.
  use "sheerun/vim-polyglot"
  use "vim-ruby/vim-ruby"
  use "tpope/vim-rails"

  -- focus.
  use {
    "chrisbra/nrrwrgn",
    "troydm/zoomwintab.vim",
  }

  -- rest controls
  use "diepm/vim-rest-console"

  -- lsp.
  use "neovim/nvim-lspconfig"
  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require "dotfiles.lsp"
    end,
  }
  use "tamago324/nlsp-settings.nvim"
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      vim.g.symbols_outline = {
        width = 30,
      }
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  }
  use {
    "SmiteshP/nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {}
    end,
  }
  use "tami5/lspsaga.nvim"
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      _G.nullformatting = function(bufnr)
        bufnr = tonumber(bufnr) or vim.api.nvim_get_current_buf()

        vim.lsp.buf_request(
          bufnr,
          "textDocument/formatting",
          { textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
          function(err, res)
            if err then
              local err_msg = type(err) == "string" and err or err.message
              -- you can modify the log message / level (or ignore it completely)
              vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
              return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
              return
            end

            if res then
              vim.lsp.util.apply_text_edits(res, bufnr)
              vim.api.nvim_buf_call(bufnr, function()
                vim.cmd "silent noautocmd update"
              end)
            end
          end
        )
      end

      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.eslint_d,
        },
        on_attach = function(client)
          if client.supports_method "textDocument/formatting" then
            -- wrap in an augroup to prevent duplicate autocmds
            vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePost <buffer> lua nullformatting(vim.fn.expand("<abuf>"))
            augroup END
            ]]
          end
        end,
      }
    end,
  }

  -- completion.
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "quangnguyen30192/cmp-nvim-tags",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
    },
    config = function()
      require "dotfiles.cmp"
    end,
  }
end)
