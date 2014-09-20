require 'rake' 
require 'fileutils' 

task :install do
  current_path = File.expand_path File.dirname(__FILE__)
  puts "-- Installing dotitup"

  link_it_up = {
    vim: "~/.vim",
    vimrc: "~/.vimrc",
  }
  
  puts "-- Linking files and folders"
  link_it_up.each do |source, destination|
    destination = File.expand_path(destination)
    source = File.expand_path(source.to_s)
    if !File.exist?(destination)
      ln_s(source, destination)
    end
  end

  puts "-- Setting up Vundle"
  vundle_path = File.join(current_path, "vim", "bundle", "Vundle.vim")
  if !File.exist?(vundle_path)
    run "git clone https://github.com/gmarik/Vundle.vim #{vundle_path}"
  end
end

task :default => 'install'

private

def run(command)
  puts "-- Running [#{command}]"
  `#{command}`
end
