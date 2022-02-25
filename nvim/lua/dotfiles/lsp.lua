-- Mappings.
local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-l>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>dd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  local map = vim.api.nvim_buf_set_keymap
  map(bufnr, "n", "<Leader>rn", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "<Leader>a", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
  map(bufnr, "x", "<Leader>a", "<cmd>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "L", "<cmd>Lspsaga hover_doc<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "gh", "<cmd>Lspsaga lsp_finder<cr>", { silent = true, noremap = true })
  map(bufnr, "n", "gs", "<cmd>Lspsaga signature_help<cr>", { silent = true, noremap = true })
  -- map(bufnr, "n", "gd", "<cmd>Lspsaga preview_definition<cr>", { silent = true, noremap = true })
  -- map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
  -- map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
  if client.name == "volar" then
    client.resolved_capabilities.document_formatting = false
  end
  if client.name == "vuels" then
    client.resolved_capabilities.document_formatting = false
  end
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
end

local lsp_installer_servers = require "nvim-lsp-installer.servers"

local servers = {
  "ansiblels",
  "bashls",
  "cssls",
  "dockerls",
  "efm",
  "eslint",
  "emmet_ls",
  "html",
  "jsonls",
  "sumneko_lua",
  "remark_ls",
  "prismals",
  "solargraph",
  "sorbet",
  "svelte",
  "tailwindcss",
  "tsserver",
  "vimls",
  "volar",
  "vuels",
  "yamlls",
}

-- Loop through the servers listed above.
local enhance_server_opts = {}
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function()
      local server_opts = {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
      }
      if enhance_server_opts[server.name] then
        -- Enhance the default opts with the server-specific ones
        enhance_server_opts[server.name](server_opts)
      end
      if server.name == "html" then
        server_opts.filetypes = { "html" }
      end
      if server.name == "efm" then
        server_opts.filetypes = { "eruby" }
      end
      server:setup(server_opts)
    end)
    if not server:is_installed() then
      server:install()
    end
  end
end
vim.diagnostic.config {
  virtual_text = false,
}
