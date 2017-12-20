require 'rake'
require 'fileutils'

task :install do
  puts '-- Installing dotitup'

  curl_it 'vim-plug',
          source: 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
          destination: current_path('vim', 'autoload', 'plug.vim')
  clone_it 'oh-my-zsh',
           source: 'https://github.com/robbyrussell/oh-my-zsh',
           destination: File.expand_path('~/.oh-my-zsh')
  clone_it 'zsh-syntax-highlighting',
           source: 'https://github.com/zsh-users/zsh-syntax-highlighting',
           destination: current_path(
             'zsh', 'plugins', 'zsh-syntax-highlighting'
           )

  puts '-- Linking files and folders'
  link_it 'vim'
  link_it 'vimrc'
  link_it 'gemrc'
  link_it 'agignore'
  link_it 'ctags'
  link_it 'zshrc'
  link_it 'tmux.conf'
  link_it 'custom oh my zsh',
          source: 'zsh',
          destination: '~/.oh-my-zsh/custom',
          pre_link: lambda {
            if File.exist?(File.expand_path('~/.oh-my-zsh/custom/example.zsh'))
              FileUtils.rm_rf(File.expand_path('~/.oh-my-zsh/custom/'))
            end
          }

  # vim-plug installing
  puts '-- vim-plug Install'
  run "vim --noplugin -u vim/plug.vim +'PlugInstall --sync' +qall"
end

task default: 'install'

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
  source = File.expand_path(source.to_s)
  options[:pre_link].call if options[:pre_link]

  ln_s(source, destination) unless File.exist?(destination)
end

def curl_it(name, options = {})
  options[:name] = name
  return if File.exist?(options[:destination])
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
