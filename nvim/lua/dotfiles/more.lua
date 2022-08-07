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
end

return M
