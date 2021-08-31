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
local package_path_str = "/home/shahid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/shahid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/shahid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/shahid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shahid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["4colors"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/4colors"
  },
  ["Catppuccino.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/Catppuccino.nvim"
  },
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["ack.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  ale = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["better-escape.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/opt/better-escape.vim"
  },
  black = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/black"
  },
  bogster = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/bogster"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["django-plus.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/django-plus.vim"
  },
  edge = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/edge"
  },
  everforest = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/everforest"
  },
  fzf = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/fzf-lua"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  indentline = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/indentline"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  melange = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/melange"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["night-owl.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/night-owl.vim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/rainbow_parentheses.vim"
  },
  ["requirements.txt.vim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/requirements.txt.vim"
  },
  rigel = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/rigel"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  sonokai = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-hybrid"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-hybrid"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-isort"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-isort"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsx"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-jsx"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-solarized8"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-solarized8"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-virtualenv"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-virtualenv"
  },
  ["vim-zoom"] = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vim-zoom"
  },
  vimspector = {
    loaded = true,
    path = "/home/shahid/.local/share/nvim/site/pack/packer/start/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: session-lens
time([[Config for session-lens]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17session-lens\frequire\0", "config", "session-lens")
time([[Config for session-lens]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
