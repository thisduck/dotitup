require "rake"
require "fileutils"

task :install do
  puts "-- Installing dotitup"

  clone_it "oh-my-zsh",
    source: "https://github.com/robbyrussell/oh-my-zsh",
    destination: File.expand_path("~/.oh-my-zsh")
  clone_it "zsh-syntax-highlighting",
    source: "https://github.com/zsh-users/zsh-syntax-highlighting",
    destination: File.expand_path("~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting")
  clone_it "powerlevel10k",
    source: "https://github.com/romkatv/powerlevel10k.git",
    destination: File.expand_path("~/.oh-my-zsh/custom/themes/powerlevel10k")
  clone_it "powerlevel10k-media",
    source: "https://github.com/romkatv/powerlevel10k-media.git",
    destination: current_path(
      "tmp", "media", "powerlevel10k-media"
    )
  clone_it ".tmux",
    source: "https://github.com/gpakosz/.tmux.git",
    destination: File.expand_path("~/.tmux")
  clone_it "packer.nvim",
    source: "https://github.com/wbthomason/packer.nvim",
    destination: File.expand_path("~/.local/share/nvim/site/pack/packer/start/packer.nvim")

  # run "pip3 install --user neovim"
  # run "npm -g install instant-markdown-d neovim eslint eslint-config-airbnb-base eslint-plugin-import"
  # npm install -g vls
  # npm install -g @volar/server

  puts "-- Linking files and folders"
  `cp ./iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/.`
  `cp ./tmp/media/powerlevel10k-media/*.ttf ~/Library/Fonts/.`
  link_it "gemrc"
  Rake::Task["setup_agignore"].execute
  Rake::Task["setup_ctags"].execute
  link_it "zshrc"
  link_it "tmux.conf"
  link_it "p10k.zsh"
  link_it "alacritty.yml"
  link_it "gitignore"
  link_it "rubocop.yml"
  run "git config --global core.excludesfile ~/.gitignore"

  link_it "nvim", destination: "~/.config/nvim"
  link_it ".tmux.conf", destination: "~/.tmux.conf", source: ".tmux/.tmux.conf"
  link_it "tmux.conf.local", destination: "~/.tmux.conf.local"
end

task :setup_ctags do
  link_it "ctags"
  link_it "ctags", destination: "~/.ctags.d/default.ctags"
end

task :setup_agignore do
  link_it "agignore"
end

task :setup_neovim do
  setup_neovim
end

task :parse_docs do
  files = Dir["./vim/settings/*.vim"] + Dir["./vim/plugs/*.vim"]
  results = []

  files.each do |file|
    contents = File.read file
    results |= contents.scan(/" ###.*?" ###/m)
  end

  File.open("./vim/guide/dotitup_docs.md", "w") do |f|
    results.each do |result|
      result = result.split("\n").collect { |line| line.sub(/^"$/, '" ') }.join("\n")
      result = result.split("\n").collect { |line| line.sub(/^" /, "") }.join("\n")
      f.puts result
      f.puts ""
    end
  end
end

task default: "install"

private

def run(command)
  puts "-- Running [#{command}]"
  `#{command}`
end

def link_it(name, options = {})
  options[:name] = name
  source = options[:source] || options[:name]
  destination = options[:destination] || "~/.#{source}"
  destination = File.expand_path(destination)
  base_destination = File.dirname(destination)
  mkdir_p(base_destination) unless File.exist?(base_destination)
  source = File.expand_path(source.to_s)
  options[:pre_link]&.call

  ln_s(source, destination) unless File.exist?(destination)
end

def curl_it(name, options = {})
  options[:name] = name
  return if File.exist?(options[:destination])

  options[:destination] = File.expand_path(options[:destination])
  puts "-- Cloning #{options[:name]}"
  run "curl -fLo #{options[:destination]} --create-dirs #{options[:source]}"
end

def clone_it(name, options = {})
  options[:name] = name
  return if File.exist?(options[:destination])

  puts "-- Cloning #{options[:name]}"
  run "git clone #{options[:source]} #{options[:destination]}"
end

def current_path(*args)
  current_path = __dir__
  File.join current_path, *args
end
