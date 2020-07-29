sudo apt-get update
sudo apt-get install -y curl \
    wget \
    python3-pip \
    neovim \
    zsh \
    tmux \
    universal-ctags \
    silversearcher-ag \
    htop \
    fd-find \
    gpg \
    watchman \
    nodejs \
    npm

sudo apt install -o Dpkg::Options::="--force-overwrite" ripgrep bat

# yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# rvm & ruby
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
bash --login rvm install 2.7.1