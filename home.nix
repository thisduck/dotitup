{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # base
    wget

    # for neovim
    neovim
    ripgrep
    silver-searcher
    fd
    python3
    python3Packages.setuptools
    python3Packages.pip
    universal-ctags

    # for system
    htop
    bat
    tmux
    rustc
    cargo
    cmake

    # for rvm
    gnupg
    autoconf
    automake
    libtool
    pkg-config
    coreutils
    libyaml
    libksba
    readline
    zlib
    openssl

    elmPackages.nodejs
    ruby
    ruby.gems.rake
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
