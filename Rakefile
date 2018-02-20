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
  link_it 'ctags', destination: '~/.ctags.d/default.ctags'
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
  vim = `which vim`.chomp
  before = <<-EOF
filetype off                  " required

set rtp+=~/.vim/plugs/
call plug#begin('~/.vim/plugged')
EOF
  after = <<-EOF
call plug#end()

filetype plugin indent on    " required
EOF

  middle = `grep -h "Plug " vim/plugs/*`
  File.open("vimplugs.vim", "w") do |f|
    f.write before
    f.write middle
    f.write after
  end
  run "#{vim} --noplugin -u vimplugs.vim +PlugInstall +qall"
  File.unlink "vimplugs.vim"
end

task :parse_docs do
  files = Dir['./vim/settings/*.vim'] + Dir['./vim/plugs/*.vim']
  results = []

  files.each do |file|
    contents = File.read file
    results |= contents.scan(/" ###.*?" ###/m)
  end

  File.open('./vim/guide/dotitup_docs.md', 'w') do |f|
    results.each do |result|
      result = result.split("\n").collect { |line| line.sub(/^"$/, '" ') }.join("\n")
      result = result.split("\n").collect { |line| line.sub(/^" /, '') }.join("\n")
      f.puts result
      f.puts ''
    end
  end
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
  base_destination = File.dirname(destination)
  mkdir_p(base_destination) unless File.exist?(base_destination)
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
