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

      vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

      vim.keymap.set({"n","x"}, "y", "<Plug>(YankyYank)")
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
})
