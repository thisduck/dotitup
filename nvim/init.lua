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
  }
})
