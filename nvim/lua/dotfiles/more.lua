local M = {}

function M.run(use)
  use "diepm/vim-rest-console"

  use {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]
    end,
  }

  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      vim.cmd [[nnoremap <silent> <Leader>dv :DiffviewOpen<CR>]]
      vim.cmd [[nnoremap <silent> <Leader>df :DiffviewFileHistory<CR>]]
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
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }
end

return M
