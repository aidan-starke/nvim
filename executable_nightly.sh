#! /bin/bash

cd ~ 

curl -s https://api.github.com/repos/neovim/neovim/releases/tags/nightly \
| grep "browser_download_url.*macos" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

xattr -c ./nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz

rm nvim-macos.tar.gz nvim-macos.tar.gz.sha256sum
