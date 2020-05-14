{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    ripgrep
    silver-searcher
    python3
    python3Packages.setuptools
    python3Packages.pip
    universal-ctags
    nodejs
    htop
    bat
    tmux
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
