#!/bin/bash

curl -L https://nixos.org/nix/install | sh

. ~/.nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

home-manager switch -f ./home.nix
