#! /bin/bash

cd ~ 

curl -s https://api.github.com/repos/neovim/neovim/releases/tags/nightly \
| grep "browser_download_url.*linux64" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

xattr -c ./nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz

rm nvim-linux64.tar.gz nvim-linux64.tar.gz.sha256sum
