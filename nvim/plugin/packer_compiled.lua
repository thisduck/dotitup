-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/adnan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/adnan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/adnan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/adnan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/adnan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-tags"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n˜\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0:nnoremap <silent> <Leader>df :DiffviewFileHistory<CR>3nnoremap <silent> <Leader>dv :DiffviewOpen<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nY\0\4\v\1\3\0\r\14\0\3\0X\4\1€4\3\0\0006\4\0\0009\4\1\0049\4\2\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\bvimß\5\1\1\t\0\24\0:6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0'\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0'\a\t\0005\b\n\0B\3\5\1\18\3\2\0'\5\4\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\r\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\4\0'\6\14\0'\a\15\0B\3\4\1\18\3\2\0'\5\r\0'\6\14\0'\a\15\0B\3\4\1\18\3\2\0'\5\4\0'\6\16\0'\a\17\0B\3\4\1\18\3\2\0'\5\4\0'\6\18\0'\a\19\0B\3\4\1\18\3\2\0'\5\4\0'\6\20\0'\a\21\0B\3\4\1\18\3\2\0'\5\4\0'\6\22\0'\a\23\0B\3\4\0012\0\0€K\0\1\0004<cmd>lua require('gitsigns').preview_hunk()<CR>\15<leader>hp4<cmd>lua require('gitsigns').reset_buffer()<CR>\15<leader>hR7<cmd>lua require('gitsigns').undo_stage_hunk()<CR>\15<leader>hu4<cmd>lua require('gitsigns').stage_buffer()<CR>\15<leader>hS2<cmd>lua require('gitsigns').reset_hunk()<CR>\15<leader>hr\6v2<cmd>lua require('gitsigns').stage_hunk()<CR>\15<leader>hs\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nÜ\3\0\0\4\0\r\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\0016\0\6\0009\0\a\0'\2\t\0B\0\2\0016\0\6\0009\0\a\0'\2\n\0B\0\2\0016\0\6\0009\0\a\0'\2\v\0B\0\2\0016\0\6\0009\0\a\0'\2\f\0B\0\2\1K\0\1\0*map <Leader>k <cmd>HopLineStartBC<CR>*map <Leader>j <cmd>HopLineStartAC<CR>Umap <Leader>e <cmd>lua require('dotfiles.hop-extensions').hint_end_of_word()<CR>#map <Leader>w <cmd>HopWord<CR>Gmap ; <cmd>lua require('dotfiles.hop-extensions').hint_char1()<CR>\bcmd\bvim\15extensions\1\0\1\tkeys\29asdghklqwer;'uiopzcvnmfj\1\2\0\0\28dotfiles.hop-extensions\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["is.vim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/is.vim",
    url = "https://github.com/haya14busa/is.vim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÒ\3\0\0\t\0\27\00046\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\2'\3\6\0=\3\5\0029\2\3\0019\2\a\2'\3\6\0=\3\5\0029\2\3\0019\2\b\2'\3\6\0=\3\5\0029\2\3\0019\2\4\2'\3\n\0=\3\t\0029\2\3\0019\2\a\2'\3\n\0=\3\t\0029\2\3\0019\2\b\2'\3\n\0=\3\t\0026\2\0\0'\4\v\0B\2\2\0029\2\f\0025\4\15\0005\5\r\0=\1\14\5=\5\16\0045\5\22\0005\6\17\0005\a\20\0009\b\18\0>\b\1\a9\b\19\0=\b\21\a>\a\3\6=\6\23\5=\5\24\0045\5\25\0=\5\26\4B\2\2\1K\0\1\0\15extensions\1\5\0\0\rquickfix\rnerdtree\rfugitive\20symbols-outline\rsections\14lualine_c\1\0\0\tcond\1\0\0\17is_available\17get_location\1\3\0\0\rfilename\17lsp_progress\foptions\1\0\0\ntheme\1\0\0\nsetup\flualine\f#3f3f46\abg\6c\6b\f#a1a1aa\afg\6a\rinactive\27lualine.themes.onenord\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  nerdtree = {
    config = { "\27LJ\2\n \1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0\29let NERDTreeShowHidden=1%map <Leader>nf :NERDTreeFind<CR>'map <Leader>nt :NERDTreeToggle<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin",
    url = "https://github.com/Xuyuanp/nerdtree-git-plugin"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  nrrwrgn = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nrrwrgn",
    url = "https://github.com/chrisbra/nrrwrgn"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\28silent noautocmd update\bcmd\bvimþ\2\1\2\a\1\18\0007\15\0\0\0X\2\19€6\2\0\0\18\4\0\0B\2\2\2\a\2\1\0X\2\2€\f\2\0\0X\2\1€9\2\2\0006\3\3\0009\3\4\3'\5\5\0\18\6\2\0&\5\6\0056\6\3\0009\6\6\0069\6\a\0069\6\b\6B\3\3\0012\0 €6\2\3\0009\2\t\0029\2\n\2-\4\0\0B\2\2\2\15\0\2\0X\2\b€6\2\3\0009\2\t\0029\2\v\2-\4\0\0'\5\f\0B\2\3\2\15\0\2\0X\3\1€2\0\17€\15\0\1\0X\2\r€6\2\3\0009\2\r\0029\2\14\0029\2\15\2\18\4\1\0-\5\0\0B\2\3\0016\2\3\0009\2\t\0029\2\16\2-\4\0\0003\5\17\0B\2\3\1K\0\1\0K\0\1\0K\0\1\0\0€\0\18nvim_buf_call\21apply_text_edits\tutil\blsp\rmodified\24nvim_buf_get_option\23nvim_buf_is_loaded\bapi\tWARN\vlevels\blog\17formatting: \vnotify\bvim\fmessage\vstring\ttypeè\1\1\1\n\0\r\0\0276\1\0\0\18\3\0\0B\1\2\2\f\0\1\0X\2\5€6\1\1\0009\1\2\0019\1\3\1B\1\1\2\18\0\1\0006\1\1\0009\1\4\0019\1\5\1\18\3\0\0'\4\6\0005\5\n\0005\6\b\0006\a\1\0009\a\a\a\18\t\0\0B\a\2\2=\a\t\6=\6\v\0053\6\f\0B\1\5\0012\0\0€K\0\1\0\0\17textDocument\1\0\0\buri\1\0\0\19uri_from_bufnr\28textDocument/formatting\16buf_request\blsp\25nvim_get_current_buf\bapi\bvim\rtonumber¥\2\0\1\4\0\5\0\n9\1\0\0'\3\1\0B\1\2\2\15\0\1\0X\2\4€6\1\2\0009\1\3\1'\3\4\0B\1\2\1K\0\1\0É\1            augroup LspFormatting\n                autocmd! * <buffer>\n                autocmd BufWritePost <buffer> lua nullformatting(vim.fn.expand(\"<abuf>\"))\n            augroup END\n            \bcmd\bvim\28textDocument/formatting\20supports_methodÂ\1\1\0\6\0\14\0\0226\0\0\0003\1\2\0=\1\1\0006\0\3\0'\2\4\0B\0\2\0029\1\5\0005\3\n\0004\4\3\0009\5\6\0009\5\a\0059\5\b\5>\5\1\0049\5\6\0009\5\a\0059\5\t\5>\5\2\4=\4\v\0033\4\f\0=\4\r\3B\1\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\reslint_d\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0\19nullformatting\a_G\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17dotfiles.cmp\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17dotfiles.lsp\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n“\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\15maintained\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\nÁ\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\2\aif\20@function.inner\aaf\20@function.outer\1\0\2\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-hint-textobject"] = {
    config = { "\27LJ\2\n¢\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0009vnoremap <silent> m :lua require('tsht').nodes()<CR>>nnoremap <silent> m :<C-U>lua require('tsht').nodes()<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/nvim-ts-hint-textobject",
    url = "https://github.com/mfussenegger/nvim-ts-hint-textobject"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onenord.nvim"] = {
    config = { "\27LJ\2\nè\1\0\0\5\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\0016\0\b\0009\0\t\0'\2\v\0B\0\2\1K\0\1\0,highlight link MatchParenCur CursorLine\"highlight clear MatchParenCur\bcmd\bvim\22custom_highlights\1\0\0\15MatchParen\1\0\0\1\0\1\abg\f#52525b\nsetup\fonenord\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\nwidth\3\30\20symbols_outline\6g\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nå\4\0\0\3\0\n\0\0286\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\b\0'\2\t\0B\0\2\1K\0\1\0\23dotfiles.telescope\frequireOnnoremap <silent>K <cmd>lua require('telescope.builtin').grep_string()<cr>Jnnoremap <Leader>he :lua require('telescope.builtin').help_tags()<CR>Hnnoremap <Leader>bs :lua require('telescope.builtin').buffers()<CR>Jnnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>Onnoremap <Leader><tab> <cmd>lua require('telescope.builtin').keymaps()<cr>innoremap <Leader>/ :lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"> \")})<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-word-column.vim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/textobj-word-column.vim",
    url = "https://github.com/coderifous/textobj-word-column.vim"
  },
  ["tmuxline.vim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/tmuxline.vim",
    url = "https://github.com/edkolev/tmuxline.vim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n›\2\0\0\3\0\6\0\0176\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\1K\0\1\0Einoremap <silent><c-t> <Esc><Cmd>exe v:count1 . \"ToggleTerm\"<CR>@nnoremap <silent><c-t> <Cmd>exe v:count1 . \"ToggleTerm\"<CR>#tnoremap <silent>jk <C-\\><C-n>0let g:toggleterm_terminal_mapping = '<C-t>'\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-closer",
    url = "https://github.com/rstacruz/vim-closer"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nð\5\0\0\3\0\r\0-6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0'\2\f\0B\0\2\1K\0\1\0.nnoremap <silent> <Leader>dp :diffput<CR>.nnoremap <silent> <Leader>dg :diffget<CR>0nnoremap <silent> <Leader>grm :Gdelete!<CR>Lnnoremap <silent> <Leader>ga :Gwrite<CR> \" to make it feel like git addEnnoremap <silent> <Leader>gw :Gwrite<CR> \" adds the current file/nnoremap <silent> <Leader>gp :Git push<CR>.nnoremap <silent> <Leader>gl :Gclog %<CR>0nnoremap <silent> <Leader>gb :Git blame<CR>1nnoremap <silent> <Leader>gc :Git commit<CR>Gnnoremap <silent> <Leader>gd :Gvdiff<CR> \" always split vertically7nnoremap <silent> <Leader>gs :10split<Bar>0Git<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-git"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-git",
    url = "https://github.com/tpope/vim-git"
  },
  ["vim-gutentags"] = {
    config = { "\27LJ\2\nT\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005let g:gutentags_file_list_command = 'rg --files'\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-highlightedyank"] = {
    config = { "\27LJ\2\nR\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0003let g:highlightedyank_highlight_duration = 600\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nå\1\0\0\3\0\6\0\0176\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\1K\0\1\0'highlight MatchParen guibg=#1c1c1c,highlight link MatchParenCur CursorLine\"highlight clear MatchParenCur-nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-mundo"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(nnoremap <Leader>u :MundoToggle<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rest-console"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-rest-console",
    url = "https://github.com/diepm/vim-rest-console"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\nk\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0L let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-ruby"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-ruby",
    url = "https://github.com/vim-ruby/vim-ruby"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n³\5\0\0\4\0\f\0\0276\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0B\1\2\2'\2\b\0&\1\2\1=\1\4\0006\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\1K\0\1\0- let g:startify_session_persistence = 1 M let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ] ò\2let g:startify_lists = [\n      \\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },\n      \\ { 'type': 'sessions',  'header': ['   Sessions']       },\n      \\ { 'type': 'files',     'header': ['   MRU']            },\n      \\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },\n      \\ { 'type': 'commands',  'header': ['   Commands']       },\n      \\ ] \14/sessions\tdata\fstdpath\afn\25startify_session_dir\6g*let g:startify_change_to_vcs_root = 1\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-subversive"] = {
    config = { "\27LJ\2\nƒ\6\0\0\3\0\14\00016\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0'\2\f\0B\0\2\0016\0\0\0009\0\1\0'\2\r\0B\0\2\1K\0\1\0Bnmap <leader>rr <plug>(SubversiveSubstituteWordRangeNoPrompt)=xmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)=nmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt):nmap <leader>ss <plug>(SubversiveSubstituteWordRange)5xmap <leader>s <plug>(SubversiveSubstituteRange)5nmap <leader>s <plug>(SubversiveSubstituteRange)(xmap P <plug>(SubversiveSubstitute)(xmap p <plug>(SubversiveSubstitute)(xmap s <plug>(SubversiveSubstitute)3nmap S <plug>(SubversiveSubstituteToEndOfLine)-nmap ss <plug>(SubversiveSubstituteLine)(nmap s <plug>(SubversiveSubstitute)\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-subversive",
    url = "https://github.com/svermeulen/vim-subversive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-fold"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-fold",
    url = "https://github.com/kana/vim-textobj-fold"
  },
  ["vim-textobj-function"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-function",
    url = "https://github.com/kana/vim-textobj-function"
  },
  ["vim-textobj-lastpat"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-lastpat",
    url = "https://github.com/kana/vim-textobj-lastpat"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-quotes"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-quotes",
    url = "https://github.com/beloglazov/vim-textobj-quotes"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment",
    url = "https://github.com/Julian/vim-textobj-variable-segment"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-yoink"] = {
    config = { "\27LJ\2\n£\2\0\0\3\0\a\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\1K\0\1\0003xmap y <plug>(YoinkYankPreserveCursorPosition)3nmap y <plug>(YoinkYankPreserveCursorPosition) nmap P <plug>(YoinkPaste_P) nmap p <plug>(YoinkPaste_p).nmap <c-n> <plug>(YoinkPostPasteSwapBack)\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/vim-yoink",
    url = "https://github.com/svermeulen/vim-yoink"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zoomwintab.vim"] = {
    loaded = true,
    path = "/Users/adnan/.local/share/nvim/site/pack/packer/start/zoomwintab.vim",
    url = "https://github.com/troydm/zoomwintab.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\n³\5\0\0\4\0\f\0\0276\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0B\1\2\2'\2\b\0&\1\2\1=\1\4\0006\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\1K\0\1\0- let g:startify_session_persistence = 1 M let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ] ò\2let g:startify_lists = [\n      \\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },\n      \\ { 'type': 'sessions',  'header': ['   Sessions']       },\n      \\ { 'type': 'files',     'header': ['   MRU']            },\n      \\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },\n      \\ { 'type': 'commands',  'header': ['   Commands']       },\n      \\ ] \14/sessions\tdata\fstdpath\afn\25startify_session_dir\6g*let g:startify_change_to_vcs_root = 1\bcmd\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n›\2\0\0\3\0\6\0\0176\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\1K\0\1\0Einoremap <silent><c-t> <Esc><Cmd>exe v:count1 . \"ToggleTerm\"<CR>@nnoremap <silent><c-t> <Cmd>exe v:count1 . \"ToggleTerm\"<CR>#tnoremap <silent>jk <C-\\><C-n>0let g:toggleterm_terminal_mapping = '<C-t>'\bcmd\bvim\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: vim-subversive
time([[Config for vim-subversive]], true)
try_loadstring("\27LJ\2\nƒ\6\0\0\3\0\14\00016\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0'\2\f\0B\0\2\0016\0\0\0009\0\1\0'\2\r\0B\0\2\1K\0\1\0Bnmap <leader>rr <plug>(SubversiveSubstituteWordRangeNoPrompt)=xmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt)=nmap <leader>r <plug>(SubversiveSubstituteRangeNoPrompt):nmap <leader>ss <plug>(SubversiveSubstituteWordRange)5xmap <leader>s <plug>(SubversiveSubstituteRange)5nmap <leader>s <plug>(SubversiveSubstituteRange)(xmap P <plug>(SubversiveSubstitute)(xmap p <plug>(SubversiveSubstitute)(xmap s <plug>(SubversiveSubstitute)3nmap S <plug>(SubversiveSubstituteToEndOfLine)-nmap ss <plug>(SubversiveSubstituteLine)(nmap s <plug>(SubversiveSubstitute)\bcmd\bvim\0", "config", "vim-subversive")
time([[Config for vim-subversive]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vim-yoink
time([[Config for vim-yoink]], true)
try_loadstring("\27LJ\2\n£\2\0\0\3\0\a\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\1K\0\1\0003xmap y <plug>(YoinkYankPreserveCursorPosition)3nmap y <plug>(YoinkYankPreserveCursorPosition) nmap P <plug>(YoinkPaste_P) nmap p <plug>(YoinkPaste_p).nmap <c-n> <plug>(YoinkPostPasteSwapBack)\bcmd\bvim\0", "config", "vim-yoink")
time([[Config for vim-yoink]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\nå\1\0\0\3\0\6\0\0176\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\1K\0\1\0'highlight MatchParen guibg=#1c1c1c,highlight link MatchParenCur CursorLine\"highlight clear MatchParenCur-nnoremap <c-k> <cmd>MatchupWhereAmI?<cr>\bcmd\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17dotfiles.lsp\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nY\0\4\v\1\3\0\r\14\0\3\0X\4\1€4\3\0\0006\4\0\0009\4\1\0049\4\2\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\bvimß\5\1\1\t\0\24\0:6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0'\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0'\a\t\0005\b\n\0B\3\5\1\18\3\2\0'\5\4\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\r\0'\6\v\0'\a\f\0B\3\4\1\18\3\2\0'\5\4\0'\6\14\0'\a\15\0B\3\4\1\18\3\2\0'\5\r\0'\6\14\0'\a\15\0B\3\4\1\18\3\2\0'\5\4\0'\6\16\0'\a\17\0B\3\4\1\18\3\2\0'\5\4\0'\6\18\0'\a\19\0B\3\4\1\18\3\2\0'\5\4\0'\6\20\0'\a\21\0B\3\4\1\18\3\2\0'\5\4\0'\6\22\0'\a\23\0B\3\4\0012\0\0€K\0\1\0004<cmd>lua require('gitsigns').preview_hunk()<CR>\15<leader>hp4<cmd>lua require('gitsigns').reset_buffer()<CR>\15<leader>hR7<cmd>lua require('gitsigns').undo_stage_hunk()<CR>\15<leader>hu4<cmd>lua require('gitsigns').stage_buffer()<CR>\15<leader>hS2<cmd>lua require('gitsigns').reset_hunk()<CR>\15<leader>hr\6v2<cmd>lua require('gitsigns').stage_hunk()<CR>\15<leader>hs\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÒ\3\0\0\t\0\27\00046\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\2'\3\6\0=\3\5\0029\2\3\0019\2\a\2'\3\6\0=\3\5\0029\2\3\0019\2\b\2'\3\6\0=\3\5\0029\2\3\0019\2\4\2'\3\n\0=\3\t\0029\2\3\0019\2\a\2'\3\n\0=\3\t\0029\2\3\0019\2\b\2'\3\n\0=\3\t\0026\2\0\0'\4\v\0B\2\2\0029\2\f\0025\4\15\0005\5\r\0=\1\14\5=\5\16\0045\5\22\0005\6\17\0005\a\20\0009\b\18\0>\b\1\a9\b\19\0=\b\21\a>\a\3\6=\6\23\5=\5\24\0045\5\25\0=\5\26\4B\2\2\1K\0\1\0\15extensions\1\5\0\0\rquickfix\rnerdtree\rfugitive\20symbols-outline\rsections\14lualine_c\1\0\0\tcond\1\0\0\17is_available\17get_location\1\3\0\0\rfilename\17lsp_progress\foptions\1\0\0\ntheme\1\0\0\nsetup\flualine\f#3f3f46\abg\6c\6b\f#a1a1aa\afg\6a\rinactive\27lualine.themes.onenord\rnvim-gps\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\n \1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0\29let NERDTreeShowHidden=1%map <Leader>nf :NERDTreeFind<CR>'map <Leader>nt :NERDTreeToggle<CR>\bcmd\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n“\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\15maintained\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nÜ\3\0\0\4\0\r\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\0016\0\6\0009\0\a\0'\2\t\0B\0\2\0016\0\6\0009\0\a\0'\2\n\0B\0\2\0016\0\6\0009\0\a\0'\2\v\0B\0\2\0016\0\6\0009\0\a\0'\2\f\0B\0\2\1K\0\1\0*map <Leader>k <cmd>HopLineStartBC<CR>*map <Leader>j <cmd>HopLineStartAC<CR>Umap <Leader>e <cmd>lua require('dotfiles.hop-extensions').hint_end_of_word()<CR>#map <Leader>w <cmd>HopWord<CR>Gmap ; <cmd>lua require('dotfiles.hop-extensions').hint_char1()<CR>\bcmd\bvim\15extensions\1\0\1\tkeys\29asdghklqwer;'uiopzcvnmfj\1\2\0\0\28dotfiles.hop-extensions\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nð\5\0\0\3\0\r\0-6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\0016\0\0\0009\0\1\0'\2\f\0B\0\2\1K\0\1\0.nnoremap <silent> <Leader>dp :diffput<CR>.nnoremap <silent> <Leader>dg :diffget<CR>0nnoremap <silent> <Leader>grm :Gdelete!<CR>Lnnoremap <silent> <Leader>ga :Gwrite<CR> \" to make it feel like git addEnnoremap <silent> <Leader>gw :Gwrite<CR> \" adds the current file/nnoremap <silent> <Leader>gp :Git push<CR>.nnoremap <silent> <Leader>gl :Gclog %<CR>0nnoremap <silent> <Leader>gb :Git blame<CR>1nnoremap <silent> <Leader>gc :Git commit<CR>Gnnoremap <silent> <Leader>gd :Gvdiff<CR> \" always split vertically7nnoremap <silent> <Leader>gs :10split<Bar>0Git<CR>\bcmd\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\nwidth\3\30\20symbols_outline\6g\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\2\aif\20@function.inner\aaf\20@function.outer\1\0\2\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: vim-mundo
time([[Config for vim-mundo]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(nnoremap <Leader>u :MundoToggle<CR>\bcmd\bvim\0", "config", "vim-mundo")
time([[Config for vim-mundo]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17dotfiles.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: vim-gutentags
time([[Config for vim-gutentags]], true)
try_loadstring("\27LJ\2\nT\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005let g:gutentags_file_list_command = 'rg --files'\bcmd\bvim\0", "config", "vim-gutentags")
time([[Config for vim-gutentags]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nå\4\0\0\3\0\n\0\0286\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\b\0'\2\t\0B\0\2\1K\0\1\0\23dotfiles.telescope\frequireOnnoremap <silent>K <cmd>lua require('telescope.builtin').grep_string()<cr>Jnnoremap <Leader>he :lua require('telescope.builtin').help_tags()<CR>Hnnoremap <Leader>bs :lua require('telescope.builtin').buffers()<CR>Jnnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>Onnoremap <Leader><tab> <cmd>lua require('telescope.builtin').keymaps()<cr>innoremap <Leader>/ :lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"> \")})<CR>\bcmd\bvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\nk\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0L let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] \bcmd\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: nvim-ts-hint-textobject
time([[Config for nvim-ts-hint-textobject]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0009vnoremap <silent> m :lua require('tsht').nodes()<CR>>nnoremap <silent> m :<C-U>lua require('tsht').nodes()<CR>\bcmd\bvim\0", "config", "nvim-ts-hint-textobject")
time([[Config for nvim-ts-hint-textobject]], false)
-- Config for: vim-highlightedyank
time([[Config for vim-highlightedyank]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0003let g:highlightedyank_highlight_duration = 600\bcmd\bvim\0", "config", "vim-highlightedyank")
time([[Config for vim-highlightedyank]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\28silent noautocmd update\bcmd\bvimþ\2\1\2\a\1\18\0007\15\0\0\0X\2\19€6\2\0\0\18\4\0\0B\2\2\2\a\2\1\0X\2\2€\f\2\0\0X\2\1€9\2\2\0006\3\3\0009\3\4\3'\5\5\0\18\6\2\0&\5\6\0056\6\3\0009\6\6\0069\6\a\0069\6\b\6B\3\3\0012\0 €6\2\3\0009\2\t\0029\2\n\2-\4\0\0B\2\2\2\15\0\2\0X\2\b€6\2\3\0009\2\t\0029\2\v\2-\4\0\0'\5\f\0B\2\3\2\15\0\2\0X\3\1€2\0\17€\15\0\1\0X\2\r€6\2\3\0009\2\r\0029\2\14\0029\2\15\2\18\4\1\0-\5\0\0B\2\3\0016\2\3\0009\2\t\0029\2\16\2-\4\0\0003\5\17\0B\2\3\1K\0\1\0K\0\1\0K\0\1\0\0€\0\18nvim_buf_call\21apply_text_edits\tutil\blsp\rmodified\24nvim_buf_get_option\23nvim_buf_is_loaded\bapi\tWARN\vlevels\blog\17formatting: \vnotify\bvim\fmessage\vstring\ttypeè\1\1\1\n\0\r\0\0276\1\0\0\18\3\0\0B\1\2\2\f\0\1\0X\2\5€6\1\1\0009\1\2\0019\1\3\1B\1\1\2\18\0\1\0006\1\1\0009\1\4\0019\1\5\1\18\3\0\0'\4\6\0005\5\n\0005\6\b\0006\a\1\0009\a\a\a\18\t\0\0B\a\2\2=\a\t\6=\6\v\0053\6\f\0B\1\5\0012\0\0€K\0\1\0\0\17textDocument\1\0\0\buri\1\0\0\19uri_from_bufnr\28textDocument/formatting\16buf_request\blsp\25nvim_get_current_buf\bapi\bvim\rtonumber¥\2\0\1\4\0\5\0\n9\1\0\0'\3\1\0B\1\2\2\15\0\1\0X\2\4€6\1\2\0009\1\3\1'\3\4\0B\1\2\1K\0\1\0É\1            augroup LspFormatting\n                autocmd! * <buffer>\n                autocmd BufWritePost <buffer> lua nullformatting(vim.fn.expand(\"<abuf>\"))\n            augroup END\n            \bcmd\bvim\28textDocument/formatting\20supports_methodÂ\1\1\0\6\0\14\0\0226\0\0\0003\1\2\0=\1\1\0006\0\3\0'\2\4\0B\0\2\0029\1\5\0005\3\n\0004\4\3\0009\5\6\0009\5\a\0059\5\b\5>\5\1\0049\5\6\0009\5\a\0059\5\t\5>\5\2\4=\4\v\0033\4\f\0=\4\r\3B\1\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\reslint_d\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0\19nullformatting\a_G\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: onenord.nvim
time([[Config for onenord.nvim]], true)
try_loadstring("\27LJ\2\nè\1\0\0\5\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\0016\0\b\0009\0\t\0'\2\v\0B\0\2\1K\0\1\0,highlight link MatchParenCur CursorLine\"highlight clear MatchParenCur\bcmd\bvim\22custom_highlights\1\0\0\15MatchParen\1\0\0\1\0\1\abg\f#52525b\nsetup\fonenord\frequire\0", "config", "onenord.nvim")
time([[Config for onenord.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n˜\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0:nnoremap <silent> <Leader>df :DiffviewFileHistory<CR>3nnoremap <silent> <Leader>dv :DiffviewOpen<CR>\bcmd\bvim\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
