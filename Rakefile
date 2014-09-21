require 'rake' 
require 'fileutils' 

task :install do
  current_path = File.expand_path File.dirname(__FILE__)
  puts "-- Installing dotitup"

  clone_it_up = [
    {
      name: "Vundle",
      source: "https://github.com/gmarik/Vundle.vim",
      destination: File.join(current_path, "vim", "bundle", "Vundle.vim")
    },
    {
      name: "oh-my-zsh",
      source: "https://github.com/robbyrussell/oh-my-zsh",
      destination: File.expand_path("~/.oh-my-zsh")
    },
    {
      name: "zsh-syntax-highlighting",
      source: "https://github.com/zsh-users/zsh-syntax-highlighting",
      destination: File.join(current_path, "zsh", "plugins", "zsh-syntax-highlighting")
    },
  ]

  clone_it_up.each do |clone|
    if !File.exist?(clone[:destination])
      puts "-- Setting up #{clone[:name]}"
      run "git clone #{clone[:source]} #{clone[:destination]}"
    end
  end

  link_it_up = [
    { name: "vim" },
    { name: "vimrc" },
    { name: "ctags" },
    { name: "zshrc" },
    { 
      name: "custom oh-my-zsh",
      source: "zsh",
      destination: "~/.oh-my-zsh/custom",
      pre_link_proc: lambda {
        if File.exist?(File.expand_path("~/.oh-my-zsh/custom/example.zsh"))
          FileUtils.rm_rf(File.expand_path("~/.oh-my-zsh/custom/"))
        end
      }
    },
  ]
  
  puts "-- Linking files and folders"
  link_it_up.each do |link|
    source = link[:source] || link[:name]
    destination = link[:destination] || "~/.#{source}"
    destination = File.expand_path(destination)
    source = File.expand_path(source.to_s)
    if link[:pre_link_proc]
      link[:pre_link_proc].call
    end
    
    if !File.exist?(destination)
      ln_s(source, destination)
    end
  end

  puts "-- Vundle Install"
  run 'vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall'
end

task :default => 'install'

private

def run(command)
  puts "-- Running [#{command}]"
  `#{command}`
end
